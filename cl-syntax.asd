(in-package :cl-user)
(defpackage cl-syntax-asd
  (:use :cl :asdf))
(in-package :cl-syntax-asd)

(defsystem cl-syntax
  :version "0.1"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:alexandria)
  :components ((:module "src"
                :components ((:file "syntax")))))
