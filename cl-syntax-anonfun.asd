(in-package :cl-user)

(defpackage :cl-syntax-anonfun-asd
  (:use :cl :asdf))
(in-package :cl-syntax-anonfun-asd)

(defsystem :cl-syntax-anonfun
  :version "0.2"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:cl-syntax :cl-anonfun)
  :components ((:file "contrib/anonfun")))
