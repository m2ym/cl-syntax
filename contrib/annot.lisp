(defpackage cl-syntax-annot
  (:nicknames :syntax-annot)
  (:use :cl)
  (:import-from :syntax
                :defsyntax)
  (:export :annot-syntax))
(in-package cl-syntax-annot)

(defsyntax annot-syntax
  (:macro-character #\@ #'cl-annot.syntax:annotation-syntax-reader))
