(asdf:defsystem :cl-syntax-fare-quasiquote
  :version "0.1"
  :author "Tomohiro Matsuyama"
  :license "LLGPL"
  :description "cl-syntax support for fare-quasiquote"
  :depends-on (:cl-syntax :fare-quasiquote)
  :components ((:file "contrib/fare-quasiquote")))
