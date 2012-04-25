(in-package :cl-user)

(defpackage :cl-syntax-asd
  (:use :cl :asdf))
(in-package :cl-syntax-asd)

(defsystem :cl-syntax
  :version "0.3"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :description "Reader Syntax Coventions for Common Lisp and SLIME"
  :depends-on (:trivial-types
               :named-readtables)
  :components ((:module "src"
                :serial t
                :components ((:file "packages")
                             (:file "specials")
                             (:file "types")
                             (:file "operators")))))
