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

(require ffi/unsafe fpbench herbie/plugin racket/match)

(eprintf "Loading vdt accelerators\n")

(define vdt-wrapper "vdtwrapper")

(set-c-header!
 (lambda (previous)
   (string-append (previous) "#include <vdtwrapper.h>\n")))

(set-unknown->c!
 (lambda (previous)
   (lambda (context operation arguments)
     (previous
      context
      (match operation
        ['vdt-exp 'vdt_exp]
        ;;['fast-sin 'sin]
        ;;['fast-cos 'cos]
        ;;['fast-tan 'tan]
        ;;['fast-tanh 'tanh]
        ;;['fast-log 'log]
        ;;['fast-asin 'asin]
        ;;['fast-acos 'acos]
        ;;['fast-atan 'atan]
        [operation operation])
      arguments))))

(define-accelerator-impl vdt-exp vdt-exp.f64 (binary64) binary64 (get-ffi-obj "vdt_exp" vdt-wrapper (_fun _double -> _double)))
