(defpackage cl-syntax-markup
  (:nicknames :syntax-markup)
  (:use :cl)
  (:import-from :syntax
                :defsyntax)
  (:export :markup-syntax))
(in-package cl-syntax-markup)

(defsyntax markup-syntax
  (:dispatch-macro-character #\# #\M #'cl-markup::markup-reader))
