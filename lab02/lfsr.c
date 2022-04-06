#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg)
{
    /* YOUR CODE HERE */

    //  orgin state :
    
    uint16_t newbit = 0;

    newbit =(*reg ^ (*reg >> 2) ^ (*reg >> 3) ^ (*reg >> 5) ) & 1;

    // set 15th bit
    *reg = (*reg >> 1) | (newbit << 15);
}
