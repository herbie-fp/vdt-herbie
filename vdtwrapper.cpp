#include <vdtMath.h>

extern "C"
{
  double vdt_exp(double x) {
    return vdt::fast_exp(x);
  }
}
