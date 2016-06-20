#include <stdio.h>

int main(int argc, char const *argv[]){
  float farh, celc;
  int lower upper, step;

  lower =   0;
  step  =  20;
  upper = 300;

  farh = lower;

  while(farh <= upper){
    celc = (5.0/9.0) * (farh - 32.0);
    printf("%3.0f %6.1f\n", farh, celc );
    farh = farh + step
  }
}
