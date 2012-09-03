(in-package :cl-user)

(syntax:define-package-syntax :infix-doller
  (:merge :standard)
  (:macro-char #\$ #'infix-doller-reader::infix-doller-reader) )
