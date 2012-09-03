(in-package :cl-user)

(defpackage :cl-syntax-infix-doller-asd
  (:use :cl :asdf))
(in-package :cl-syntax-infix-doller-asd)

(defsystem :cl-syntax-infix-doller
  :version "0.1"
  :author "Shingo SUZUKI"
  :license "LLGPL"
  :description "CL-Syntax Reader Syntax for infix-doller-reader"
  :depends-on (:cl-syntax :infix-doller-reader)
  :components ((:file "contrib/infix-doller")))
