(defpackage cl-syntax-clsql
  (:nicknames :syntax-clsql)
  (:use :cl)
  (:import-from :syntax
                :defsyntax)
  (:export :clsql-syntax))
(in-package cl-syntax-clsql)

(defsyntax clsql-syntax
  (:macro-character #\[ #'clsql-sys::sql-reader-open)
  (:macro-character #\] (get-macro-character #\))))
