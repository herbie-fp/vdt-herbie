#lang info

(define collection "vdt-herbie")
(define deps '("base" "fpbench"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib" ("herbie" #:version "2.0")))
(define install-collection "install.rkt")
(define compile-omit-files '("install.rkt"))
(define pkg-desc "Herbie plugin for vdt accelerators")
(define version "1.0")
(define pkg-authors '("Jackson Brough"))
(define herbie-plugin 'vdt-herbie)
