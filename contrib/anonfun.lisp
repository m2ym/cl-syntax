(in-package :cl-user)

(syntax:define-package-syntax :cl-anonfun
  (:merge :standard)
  (:dispatch-macro-char #\# #\% #'cl-anonfun::fn-reader))
