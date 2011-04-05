(defpackage cl-syntax-interpol
  (:nicknames :syntax-interpol)
  (:use :cl)
  (:import-from :syntax
                :defsyntax)
  (:export :interpol-syntax))
(in-package cl-syntax-interpol)

(defsyntax interpol-syntax
  (:dispatch-macro-character #\# #\? #'cl-interpol::interpol-reader))
