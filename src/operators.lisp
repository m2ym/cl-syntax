(in-package :cl-syntax)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun package-syntax-name (package)
    (intern *standard-package-syntax-name* package)))

(defun get-options (name)
  "Get the options list for name, if it is available."
  (get (cond ((typep name 'syntax) nil)
	((and (typep name 'package-designator)
	      (find-package name))
	 (package-syntax-name name))
	(t name))
       :options))

(defmacro defsyntax (name &body options)
  `(progn
     (setf (get ',name :options) ',options)
     (defvar ,name (defreadtable ,name ,@options))))

(defmacro define-package-syntax (&body (package . options))
  (unless (typep package 'package-designator)
    (push package options)
    (setq package *package*))
  `(defsyntax ,(package-syntax-name package)
     ,@options))

(defun find-syntax (name)
  (declare (syntax-designator name))
  (cond ((typep name 'syntax) name)
        ((and (typep name 'package-designator)
              (find-package name))
         (find-readtable (package-syntax-name name)))
        (t (find-readtable name))))

(defun %use-syntax (names)
  (declare (type (or syntax-designator
                     (proper-list syntax-designator))
                 names))
  (unless (listp names)
    (setq names (list names)))
  (setq *readtable* (copy-readtable))
  (loop for name in names
        for syntax = (find-syntax name)
        for options = (get-options name)
        if (assoc :fuze (if (consp (car options)) options (cdr options))) do
          (handler-bind ((named-readtables:reader-macro-conflict
                            (lambda (_) (declare (ignore _))
                              (invoke-restart 'continue))))
             (merge-readtables-into *readtable* syntax) )
        else do
          (merge-readtables-into *readtable* syntax) )
  (when (find-package :swank)
    (named-readtables::%frob-swank-readtable-alist *package* *readtable*)))

(defmacro use-syntax (name)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (%use-syntax ,name)))
