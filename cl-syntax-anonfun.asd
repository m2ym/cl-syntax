(in-package :cl-user)
(defpackage cl-syntax-anonfun-asd
  (:use :cl :asdf))
(in-package :cl-syntax-anonfun-asd)

(defsystem cl-syntax-anonfun
  :version "0.1"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:cl-syntax
               :cl-anonfun)
  :components ((:module "contrib"
                :components ((:file "anonfun")))))
