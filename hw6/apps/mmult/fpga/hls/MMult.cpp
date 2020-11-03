#include "MMult.h"
#include <hls_stream.h>

/**
 *
 * Design principles to achieve II = 1
 * 1. Stream data into local RAM for inputs (multiple access required)
 * 2. Partition local RAMs into N/2 sub-arrays for fully parallel access
 * (dual-port read)
 * 3. Pipeline the dot-product loop, to fully unroll it
 * 4. Separate multiply-accumulate in inner loop to force two FP operators
 *
 */

void read(  const float *arrayA, 
            const float *arrayB,
            hls::stream<float> &inA,
            hls::stream<float> &inB,
            unsigned int numInputs){

    for(unsigned int i = 0; i < numInputs; ++i){
        
        #pragma HLS PIPELINE
        inA.write(arrayA[i]);
        inB.write(arrayB[i]);
    }
}


void exec(  hls::stream<float> &inA,
            hls::stream<float> &inB,
            hls::stream<float> &outStream){
    
    float A_tmp[N][N];
    #pragma HLS array_partition variable=A_tmp block factor=16 dim=2
    
    float B_tmp[N][N];
    #pragma HLS array_partition variable=B_tmp block factor=16 dim=1

    for (int c = 0; c < CHUNKS; c++) {
        
        // inA to A_tmp
        int i = 0;
        int j = 0;
        for (int itr = 0; itr < N * N; ++itr) {
            
            if(j == N) { j = 0; ++i}
            
            A_tmp[i][j] = inA.read();
            ++j;
        }
        
        // inB to B_tmp
        i = 0;
        j = 0;
        for (int itr = 0; itr < N * N; ++itr) {
            
            if(j == N) { j = 0; ++i}
            
            B_tmp[i][j] = inB.read();
            ++j;
        }

        // multiply
        for(int i = 0; i < N; ++i){
            for(int j = 0; j < N; ++j){
                
                float res = 0;
                
                for(int k = 0; k < N; ++k)
                    res += A_tmp[i][k] * B_tmp[k][j];
                
                outStream.write(res);
            }
        }
    }
}

void write( hls::stream<float> &outStream,
            int *output,
            unsigned int numInputs){

    for(unsigned int i = 0; i < numInputs; i++)
        output[i] = outStream.read();
}


void mmult_fpga(float A[CHUNKS * N * N], float B[CHUNKS * N * N],
                float C[CHUNKS * N * N]) {

    #pragma HLS INTERFACE ap_ctrl_chain port=return bundle=control
    #pragma HLS DATAFLOW
    hls::stream<float> inA;
    hls::stream<float> inB;
    hls::stream<float> outStream;

    read(A, B, inA, inB, CHUNKS * N * N);
    exec(inA, inB, outStream);
    write(outStream, C, CHUNKS * N *N);
}



