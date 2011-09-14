(in-package :cl-user)

(defpackage :cl-syntax-annot-asd
  (:use :cl :asdf))
(in-package :cl-syntax-annot-asd)

(defsystem :cl-syntax-annot
  :version "0.2"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :depends-on (:cl-syntax :cl-annot)
  :components ((:file "contrib/anot")))
