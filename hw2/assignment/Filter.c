#include <stdlib.h>
#include <stdio.h>
#include "App.h"
/*======================UTILITY FUNCTIONS========================*/
#include <cstdint>
#include <chrono>
#include <iostream>

class stopwatch
{
  public:
    double total_time, calls;
    std::chrono::time_point<std::chrono::high_resolution_clock> start_time, end_time;
    stopwatch() : total_time(0), calls(0) {};

    inline void reset() {
      total_time = 0;
      calls = 0;
    }

    inline void start() {
      start_time = std::chrono::high_resolution_clock::now();
      calls++;
    };

    inline void stop() {
      end_time = std::chrono::high_resolution_clock::now();
      auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end_time-start_time).count();
      total_time += static_cast<double>(elapsed);
    };

    // return latency in ns
    inline double latency() {
      return total_time;
    };

    // return latency in ns
    inline double avg_latency() {
      return (total_time / calls);
    };
};

#define INPUT_HEIGHT (1500)
#define INPUT_WIDTH (2000)

#define FILTER_LENGTH (7)

#define OUTPUT_HEIGHT (INPUT_HEIGHT - (FILTER_LENGTH - 1))
#define OUTPUT_WIDTH (INPUT_WIDTH - (FILTER_LENGTH - 1))

unsigned Coefficients[] = {2, 15, 62, 98, 62, 15, 2};

void Filter_horizontal(const unsigned char * Input, unsigned char * Output)
{
  for (int Y = 0; Y < INPUT_HEIGHT; Y++)
    for (int X = 0; X < OUTPUT_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (int i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[Y * INPUT_WIDTH + X + i];
      Output[Y * OUTPUT_WIDTH + X] = Sum >> 8;
    }
}

static void Filter_vertical(const unsigned char * Input, unsigned char * Output)
{
  for (int Y = 0; Y < OUTPUT_HEIGHT; Y++)
    for (int X = 0; X < OUTPUT_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (int i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[(Y + i) * OUTPUT_WIDTH + X];
      Output[Y * OUTPUT_WIDTH + X] = Sum >> 8;
    }
}

void Filter(const unsigned char * Input, unsigned char * Output)
{
  stopwatch horizontal_time;
  stopwatch vertical_time;

  unsigned char * Temp = (unsigned char*)malloc(INPUT_HEIGHT * OUTPUT_WIDTH);
  
  horizontal_time.start();
  Filter_horizontal(Input, Temp);
  horizontal_time.stop();

  vertical_time.start();
  Filter_vertical(Temp, Output);
  vertical_time.stop();

  free(Temp);
  std::cout << "Total time taken by filter_horizontal is  : " << horizontal_time.latency()      << " ns." << std::endl;
  std::cout << "Total time taken by filter_vertical is    : " << vertical_time.latency()        << " ns." << std::endl;
  std::cout << "---------------------------------------------------------------" << std::endl;
  std::cout << "Average latency of filter_horizontal  is  : " << horizontal_time.avg_latency()  << " ns." << std::endl;
  std::cout << "Average latency of filter_vertical  is    : " << vertical_time.avg_latency()    << " ns." << std::endl;

}

