(in-package :cl-user)

(defpackage :cl-syntax-interpol-asd
  (:use :cl :asdf))
(in-package :cl-syntax-interpol-asd)

(defsystem :cl-syntax-interpol
  :version "0.2"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :description "CL-Syntax Reader Syntax for CL-INTERPOL"
  :depends-on (:cl-syntax :cl-interpol)
  :components ((:file "contrib/interpol")))
