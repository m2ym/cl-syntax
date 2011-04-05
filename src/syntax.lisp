(defpackage cl-syntax
  (:nicknames :syntax)
  (:use :cl)
  (:import-from :alexandria
                :destructuring-ecase)
  (:export :use-syntax
           :defsyntax))
(in-package :cl-syntax)

(defun install-to-readtable (syntax readtable)
  (dolist (option syntax)
    (destructuring-ecase option
      ((:macro-character char fn &optional non-terminating-p)
       (set-macro-character char fn non-terminating-p readtable))
      ((:dispatch-macro-character disp-ch sub-ch fn)
       (set-dispatch-macro-character disp-ch sub-ch fn readtable)))))

(defun install-to-swank-readtable-alist (syntax package)
  (let* ((swank (find-package :swank))
         (readtable-alist
          (when swank
            (find-symbol (string '#:*readtable-alist*)
                         swank))))
    (when (and readtable-alist
               (boundp readtable-alist))
      (let* ((package-name (package-name package))
             (readtable (cdr (assoc package-name (symbol-value readtable-alist)))))
        (if readtable
            (install-to-readtable syntax readtable)
            (let ((readtable (copy-readtable)))
              (install-to-readtable syntax readtable)
              (push (cons package-name readtable)
                    (symbol-value readtable-alist))))))))

(defun %use-syntax (syntax-to-use)
  (when (symbolp syntax-to-use)
    (setf syntax-to-use (symbol-value syntax-to-use)))
  (setf *readtable* (copy-readtable))
  (install-to-readtable syntax-to-use *readtable*)
  (install-to-swank-readtable-alist syntax-to-use *package*))

(defmacro use-syntax (syntax-to-use)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (%use-syntax ',syntax-to-use)))

(defmacro defsyntax (name &body options)
  (let ((syntax
         `(list ,@(loop for option in options
                        collect `(list ,@option)))))
    `(progn
       (defvar ,name)
       (setf ,name ,syntax)
       ;; TODO cl-annot
       (defvar ,name))))
