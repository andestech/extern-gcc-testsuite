/* Test the `vreinterpretQf32_s8' ARM Neon intrinsic.  */
/* This file was autogenerated by neon-testgen.  */

/* { dg-do assemble } */
/* { dg-require-effective-target arm_neon_ok } */
/* { dg-options "-save-temps -O0" } */
/* { dg-add-options arm_neon } */

#include "arm_neon.h"

void test_vreinterpretQf32_s8 (void)
{
  float32x4_t out_float32x4_t;
  int8x16_t arg0_int8x16_t;

  out_float32x4_t = vreinterpretq_f32_s8 (arg0_int8x16_t);
}

