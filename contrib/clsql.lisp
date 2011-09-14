(in-package :cl-user)

(syntax:define-package-syntax :clsql
  (:merge :standard)
  (:macro-char #\[ #'clsql-sys::sql-reader-open)
  (:macro-char #\] (cl:get-macro-character #\))))
