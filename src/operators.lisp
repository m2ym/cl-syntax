(in-package :cl-syntax)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun package-syntax-name (package)
    (intern *standard-package-syntax-name* package)))

(defmacro defsyntax (name &body options)
  `(defreadtable ,name ,@options))

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

(defun %use-syntax (name)
  (declare (type (or syntax-designator
                     (proper-list syntax-designator))
                 name))
  (unless (listp name)
    (setq name (list name)))
  (apply #'merge-readtables-into
         *readtable*
         (mapcar #'find-syntax name))
  (when (find-package :swank)
    (named-readtables::%frob-swank-readtable-alist *package* *readtable*)))

(defmacro use-syntax (name)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (%use-syntax ,name)))
