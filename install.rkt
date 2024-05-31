#lang racket/base

(require racket/string racket/system setup/dirs)

(provide installer)

(define (installer collects-directory current-collection-path user-specific?)
  (eprintf "hello there: ~a\n" current-collection-path)
  (system
   (string-join
    (list
     "gcc"
     (path->string (build-path current-collection-path "vdtwrapper.cpp"))
     "-shared"
     "-o"
     (path->string (build-path (if user-specific? (find-user-lib-dir) (find-lib-dir))
                               (path-replace-extension "vdtwrapper.so" (system-type 'so-suffix))))))))
