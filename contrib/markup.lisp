(in-package :cl-user)

(syntax:define-package-syntax :cl-markup
  (:merge :standard)
  (:dispatch-macro-char #\# #\M #'cl-markup::markup-reader))
