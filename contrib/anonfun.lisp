(defpackage cl-syntax-anonfun
  (:nicknames :syntax-anonfun)
  (:use :cl)
  (:import-from :syntax
                :defsyntax)
  (:export :anonfun-syntax))
(in-package cl-syntax-anonfun)

(defsyntax anonfun-syntax
  (:dispatch-macro-character #\# #\% #'cl-anonfun::fn-reader))
