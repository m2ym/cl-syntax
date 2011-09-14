(in-package :cl-user)

(defpackage :cl-syntax
  (:nicknames :syntax)
  (:use :cl :named-readtables)
  (:import-from :trivial-types
                #:package-designator
                #:proper-list)
  (:export #:syntax
           #:syntax-designator
           #:defsyntax
           #:define-package-syntax
           #:find-syntax
           #:use-syntax))
