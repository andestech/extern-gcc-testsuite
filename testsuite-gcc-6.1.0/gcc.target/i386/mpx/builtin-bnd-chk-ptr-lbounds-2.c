/* { dg-do run } */
/* { dg-options "-fno-check-pointer-bounds" } */


#include "mpx-check.h"

int buf[100];

int mpx_test (int argc, const char **argv)
{
  __bnd_chk_ptr_lbounds (buf - 1);
  return 0;
}
