(in-package :cl-user)
(defpackage cl-syntax-interpol-asd
  (:use :cl :asdf))
(in-package :cl-syntax-interpol-asd)

(defsystem cl-syntax-interpol
  :version "0.1"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:cl-syntax)
  :components ((:module "contrib"
                :components ((:file "interpol")))))
