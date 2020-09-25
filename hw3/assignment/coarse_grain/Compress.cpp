#define SIZE (264 * 474)
#include "App.h"
unsigned long long int Codes[] =
    {
        0b11,
        0b00,
        0b0111,
        0b10001,
        0b01011,
        0b01000,
        0b100001,
        0b1010001,
        0b1001000,
        0b10101110,
        0b10101010,
        0b10101111,
        0b0100110,
        0b10010111,
        0b01101010,
        0b101000010,
        0b011010110,
        0b1001011010,
        0b1010000111,
        0b100000011,
        0b101000000,
        0b100100110,
        0b1010101111,
        0b0100111110,
        0b10010010100,
        0b01001110111,
        0b10010110110,
        0b1001001001,
        0b1010101110,
        0b1001001011,
        0b10010101111,
        0b101010110000,
        0b1010101100110,
        0b1010101100011,
        0b100101101111,
        0b10010110001,
        0b0100111001,
        0b10010101010,
        0b100100101011,
        0b1001001000111,
        0b10010010000110,
        0b10010101110111,
        0b1010101100100,
        0b01001110000,
        0b10000000001,
        0b100101010111,
        0b0100111111011,
        0b101010110010111,
        0b1010101100111111,
        0b100101011101100,
        0b10101011001010,
        0b010011110100,
        0b100100100010,
        0b1001001010101,
        0b01001111110000,
        0b1000000001101111,
        0b10101011001111010,
        0b1010101100111001,
        0b100101101110110,
        0b0100111111001,
        0b1001010101100,
        0b10010010000111,
        0b1010101100010100,
        0b101010110011100000,
        0b010011111101001000,
        0b01001110110101011,
        0b010011101101011,
        0b10010010000101,
        0b10101011000100,
        0b100000000110010,
        0b10101011001110001,
        0b010011111101010000,
        0b1001001010100100111,
        0b010011111101010101,
        0b1001001010100110,
        0b100101101110111,
        0b101010110011101,
        0b0100111111010011,
        0b1001010111001110010,
        0b10010101110011110011,
        0b10010101110100001001,
        0b010011111101001001,
        0b10010101110011101,
        0b1001001010100111,
        0b010011101101001,
        0b100101011100111110,
        0b1001010111011010001,
        0b10010101110100000100000001,
        0b10010101110100000111,
        0b1001010111011010100,
        0b101010110011110010,
        0b1000000001101110,
        0b1001001010100101,
        0b1001010111010000001,
        0b1001010111010000010000000000000000000001,
        0b1001010111010000010000000000001,
        0b10010101110100000100000000000000000000001,
        0b100101011101000001000001,
        0b010011111101001011,
        0b01001111110101001,
        0b01001111110101011,
        0b10010101110100001100,
        0b10010101110011100001,
        0b100101011101000001000000000000000000000001,
        0b10010101110100000100000000000001,
        0b10010101110110100000,
        0b10010101110100000110,
        0b01001111110101111,
        0b100101011100111101,
        0b1001010111010000010000000000000000000000001,
        0b100101011101000001000000001,
        0b10010101110100000100000000000000000000000001,
        0b100101011101000001000000000000001,
        0b100101011101000001000000000000000000000000001,
        0b10010101110110100001,
        0b1001010111011011010,
        0b10010101110100001011,
        0b10010101110100000100001,
        0b10010101110011110000,
        0b1001010111010000010000000000000000000000000001,
        0b1001010111010000010000000000000001,
        0b10010101110100000100000000000000000000000000001,
        0b10010101110100000101,
        0b100101011101000001001,
        0b10010101110100001101,
        0b1001010111010000010000000001,
        0b100101011101000001000000000000000000000000000001,
        0b1001010111010000010000000000000000000000000000000000000000,
        0b1001010111010000010000000000000000000000000000000000000001,
        0b10010101110100000100000000000000001,
        0b1001010111010000010000000000000000000000000000001,
        0b010011111101001010,
        0b1001010111010000010000001,
        0b10010101110100000100000000000000000000000000000001,
        0b10010101110110101010,
        0b100101011101000001000000000000000001,
        0b100101011101000001000000000000000000000000000000001,
        0b10010101110100000100000000001,
        0b10010101110110101011,
        0b100101011101101011,
        0b10010101110100001000,
        0b10010101110100000000,
        0b1001010111011011011,
        0b1001010111010000010000000000000000000000000000000001,
        0b1001010111010000010000000000000000001,
        0b10010101110100000100000000000000000000000000000000001,
        0b1001010111010000010001,
        0b010011111101010001,
        0b1001010111011011000,
        0b010011111101010100,
        0b100101011101101001,
        0b10010101110100001010,
        0b100101011101000001000000000000000000000000000000000001,
        0b10010101110100000100000000000000000001,
        0b10010101110011100000,
        0b100101011101001100,
        0b100101011101001101,
        0b01001111110101110,
        0b10101011001111011,
        0b10010101110110110011,
        0b10010101110110110010,
        0b1001010111010000010000000000000000000000000000000000001,
        0b100101011101000001000000000001,
        0b1001010111001110011,
        0b101010110011100001,
        0b1001010111010010,
        0b1000000001101101,
        0b1001001010100100110,
        0b10010101110100000100000000000000000000000000000000000001,
        0b100101011101000001000000000000000000001,
        0b10010101110100000001,
        0b100101011100111111,
        0b1000000001101100,
        0b100101011100110,
        0b1010101100111110,
        0b101010110011110011,
        0b100101011101000001000000000000000000000000000000000000001,
        0b10010101110011110010,
        0b1001010111010000111,
        0b0100111011010100,
        0b100000000110000,
        0b10010010101000,
        0b100000000110011,
        0b10010101110110111,
        0b100100101010010010,
        0b10010101110011110001,
        0b010011101101010101,
        0b1010101100010101,
        0b10000000011010,
        0b10101101101011,
        0b101010110010110,
        0b0100111111010110,
        0b1001010111001110001,
        0b010011101101010100,
        0b10010010101001000,
        0b101010110001011,
        0b1001001000110,
        0b1001011011100,
        0b10010110111010,
        0b100000000110001,
        0b10101011001111000,
        0b10010101110100111,
        0b010011111101000,
        0b0100111011011,
        0b011010111011,
        0b100100100000,
        0b1001010111000,
        0b01001111110001,
        0b1001010111010001,
        0b010011101101000,
        0b10010101110010,
        0b010011110101,
        0b01101011100,
        0b10000000010,
        0b100000000111,
        0b10101101101010,
        0b10010010000100,
        0b10010101110101,
        0b010011101100,
        0b10000000000,
        0b0100111100,
        0b0100111010,
        0b01001111011,
        0b011010111010,
        0b1001010101101,
        0b1010110110100,
        0b01001110001,
        0b0110101111,
        0b1010110111,
        0b1001011001,
        0b10101101100,
        0b01001111111,
        0b101011011011,
        0b10010110000,
        0b1001010110,
        0b100000001,
        0b101000001,
        0b100100111,
        0b1010101101,
        0b1001010100,
        0b1010000110,
        0b100000010,
        0b101011010,
        0b10010100,
        0b0100101,
        0b0110100,
        0b10101100,
        0b0100100,
        0b1000001,
        0b1010100,
        0b011011,
        0b101001,
        0b01010,
        0b01100,
        0b10011,
        0b1011};

int Code_lengths[] =
    {
        2, 2, 4, 5, 5, 5, 6, 7, 7, 8, 8, 8, 7, 8, 8, 9, 9, 10, 10, 9, 9, 9, 10, 10,
        11, 11, 11, 10, 10, 10, 11, 12, 13, 13, 12, 11, 10, 11, 12, 13, 14, 14, 13,
        11, 11, 12, 13, 15, 16, 15, 14, 12, 12, 13, 14, 16, 17, 16, 15, 13, 13, 14,
        16, 18, 18, 17, 15, 14, 14, 15, 17, 18, 19, 18, 16, 15, 15, 16, 19, 20, 20,
        18, 17, 16, 15, 18, 19, 26, 20, 19, 18, 16, 16, 19, 40, 31, 41, 24, 18, 17,
        17, 20, 20, 42, 32, 20, 20, 17, 18, 43, 27, 44, 33, 45, 20, 19, 20, 23, 20,
        46, 34, 47, 20, 21, 20, 28, 48, 58, 58, 35, 49, 18, 25, 50, 20, 36, 51, 29,
        20, 18, 20, 20, 19, 52, 37, 53, 22, 18, 19, 18, 18, 20, 54, 38, 20, 18, 18,
        17, 17, 20, 20, 55, 30, 19, 18, 16, 16, 19, 56, 39, 20, 18, 16, 15, 16, 18,
        57, 20, 19, 16, 15, 14, 15, 17, 18, 20, 18, 16, 14, 14, 15, 16, 19, 18, 17,
        15, 13, 13, 14, 15, 17, 17, 15, 13, 12, 12, 13, 14, 16, 15, 14, 12, 11, 11,
        12, 14, 14, 14, 12, 11, 10, 10, 11, 12, 13, 13, 11, 10, 10, 10, 11, 11, 12,
        11, 10, 9, 9, 9, 10, 10, 10, 9, 9, 8, 7, 7, 8, 7, 7, 7, 6, 6, 5, 5, 5, 4};

static int Length = 0;
static int Byte = 0;

int Compress(const unsigned char *Input, unsigned char *Output, int Size_Start_Idx, int Size_End_Idx)
{
  for (int i = Size_Start_Idx; i < Size_End_Idx; i++)
  {
    unsigned long long Code = Codes[Input[i]];
    int Code_length = Code_lengths[Input[i]];

    for (int j = 0; j < Code_length; j++)
    {
      Byte = (Byte << 1) | ((Code >> (Code_length - 1 - j)) & 1);

      if (++Length % 8 == 0)
      {
        Output[Length / 8 - 1] = Byte;
        Byte = 0;
      }
    }
  }

  if (Length % 8 > 0)
    Output[Length / 8] = Byte;

  return Length / 8 + 1;
}
