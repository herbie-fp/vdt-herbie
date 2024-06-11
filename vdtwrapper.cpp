#include <vdt/vdtMath.h>

extern "C"
{
  double exp(double x) {
    return vdt::fast_exp(x);
  }
  double sin(double x) {
    return vdt::fast_sin(x);
  }
  double cos(double x) {
    return vdt::fast_cos(x);
  }
  double tan(double x) {
    return vdt::fast_tan(x);
  }
  double tanh(double x) {
    return vdt::fast_tanh(x);
  }
  double log(double x) {
    return vdt::fast_log(x);
  }
  double asin(double x) {
    return vdt::fast_asin(x);
  }
  double acos(double x) {
    return vdt::fast_acos(x);
  }
  double atan(double x) {
    return vdt::fast_atan(x);
  }
  double isqrt(double x) {
    return vdt::fast_isqrt(x);
  }
  float expf(float x) {
    return vdt::fast_expf(x);
  }
  float sinf(float x) {
    return vdt::fast_sinf(x);
  }
  float cosf(float x) {
    return vdt::fast_cosf(x);
  }
  float tanf(float x) {
    return vdt::fast_tanf(x);
  }
  float tanhf(float x) {
    return vdt::fast_tanhf(x);
  }
  float logf(float x) {
    return vdt::fast_logf(x);
  }
  float asinf(float x) {
    return vdt::fast_asinf(x);
  }
  float acosf(float x) {
    return vdt::fast_acosf(x);
  }
  float atanf(float x) {
    return vdt::fast_atanf(x);
  }
  float isqrtf(float x) {
    return vdt::fast_isqrtf(x);
  }
}
