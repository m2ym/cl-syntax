(in-package :cl-user)

(syntax:define-package-syntax :cl-annot
  (:merge :standard)
  (:macro-char #\@ #'cl-annot.syntax:annotation-syntax-reader))
