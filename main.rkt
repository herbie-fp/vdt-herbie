#lang racket/base

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

(require ffi/unsafe fpbench racket/match)

;(eprintf "Loading vdt accelerators\n")
(provide vdt-exp  vdt-sin  vdt-cos  vdt-tan  vdt-tanh  vdt-log  vdt-acos  vdt-asin  vdt-atan  vdt-isqrt
         vdt-expf vdt-sinf vdt-cosf vdt-tanf vdt-tanhf vdt-logf vdt-acosf vdt-asinf vdt-atanf vdt-isqrtf)
(define vdt-wrapper "vdtwrapper")

(set-c-header!
 (lambda (previous)
   (string-append (previous) "#include <vdt-wrapper.h>\n")))

(set-unknown->c!
 (lambda (previous)
   (lambda (context operation arguments)
     (previous
      context
      (match operation
        ['fast-exp 'vdt::fast_exp]
        ['fast-sin 'vdt::fast_sin]
        ['fast-cos 'vdt::fast_cos]
        ['fast-tan 'vdt::fast_tan]
        ['fast-tanh 'vdt::fast_tanh]
        ['fast-log 'vdt::fast_log]
        ['fast-asin 'vdt::fast_asin]
        ['fast-acos 'vdt::fast_acos]
        ['fast-atan 'vdt::fast_atan]
        ['fast-isqrt 'vdt::fast_isqrt]
        [operation operation]
        )
      arguments))))

(define vdt-exp (get-ffi-obj "exp" vdt-wrapper (_fun _double -> _double)))
(define vdt-sin (get-ffi-obj "sin" vdt-wrapper (_fun _double -> _double)))
(define vdt-cos (get-ffi-obj "cos" vdt-wrapper (_fun _double -> _double)))
(define vdt-tan (get-ffi-obj "tan" vdt-wrapper (_fun _double -> _double)))
(define vdt-tanh (get-ffi-obj "tanh" vdt-wrapper (_fun _double -> _double)))
(define vdt-log (get-ffi-obj "log" vdt-wrapper (_fun _double -> _double)))
(define vdt-asin (get-ffi-obj "asin" vdt-wrapper (_fun _double -> _double)))
(define vdt-acos (get-ffi-obj "acos" vdt-wrapper (_fun _double -> _double)))
(define vdt-atan (get-ffi-obj "atan" vdt-wrapper (_fun _double -> _double)))
(define vdt-isqrt (get-ffi-obj "isqrt" vdt-wrapper (_fun _double -> _double)))

(define vdt-expf (get-ffi-obj "expf" vdt-wrapper (_fun _float -> _float)))
(define vdt-sinf (get-ffi-obj "sinf" vdt-wrapper (_fun _float -> _float)))
(define vdt-cosf (get-ffi-obj "cosf" vdt-wrapper (_fun _float -> _float)))
(define vdt-tanf (get-ffi-obj "tanf" vdt-wrapper (_fun _float -> _float)))
(define vdt-tanhf (get-ffi-obj "tanhf" vdt-wrapper (_fun _float -> _float)))
(define vdt-logf (get-ffi-obj "logf" vdt-wrapper (_fun _float -> _float)))
(define vdt-asinf (get-ffi-obj "asinf" vdt-wrapper (_fun _float -> _float)))
(define vdt-acosf (get-ffi-obj "acosf" vdt-wrapper (_fun _float -> _float)))
(define vdt-atanf (get-ffi-obj "atanf" vdt-wrapper (_fun _float -> _float)))
(define vdt-isqrtf (get-ffi-obj "isqrtf" vdt-wrapper (_fun _float -> _float)))