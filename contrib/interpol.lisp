(in-package :cl-user)

(syntax:define-package-syntax :cl-interpol
  (:merge :standard)
  (:dispatch-macro-char #\# #\? #'cl-interpol::interpol-reader))
