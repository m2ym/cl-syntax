(in-package :cl-user)
(defpackage cl-syntax-markup-asd
  (:use :cl :asdf))
(in-package :cl-syntax-markup-asd)

(defsystem cl-syntax-markup
  :version "0.1"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:cl-syntax
               :cl-markup)
  :components ((:module "contrib"
                :components ((:file "markup")))))
