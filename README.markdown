CL-SYNTAX
=========

CL-SYNTAX provides Reader Syntax Coventions for Common Lisp and SLIME.

Overview
--------

The well-known problem about reader macros is that SLIME can't handle
these reader macros correctly. Consider the following code:

    (defpackage foo
      (:use :cl))
    (in-package :foo)
    (cl-interpol:enable-interpol-syntax)
    
    (list #?"Current Time: ${(get-universal-time)}")

By calling `cl-interpol:enable-interpol-syntax`, we can use a reader
macro `#?`. However, actually, when we try to evaluate the last line,
SLIME reports an error there is no such the reader macro `#?`. This
error might be raised on most of Common Lisp implementations except
SBCL.

The goal of CL-SYNTAX is to solve these problems. Instead of using
procedurally defined functions such like `enable-something-syntax`, we
introduce syntactically and declaratively defined syntax data
structure. With this data structure, we can handle `*readtable*`
correctly and readtables of swank server.

Usage
-----

### Macro: `defsyntax`

    defsyntax name &body options

`defsyntax` defines a new syntax. `name` is a symbol and `options` is
a list of option.

If option formed `(:macro-character char fn &optional
non-terminating-p)`, the syntax engine will call `set-macro-character`
with the arguments when enabling the syntax.

If option formed `(:dispatch-macro-character disp-ch sub-ch fn)`, the
syntax engine will call `set-dispatch-macro-character` with the
arguments when enabling the syntax.

Here is an example:

    ;; Define cl-interpol syntax
    (defsyntax interpol-syntax
      (:dispatch-macro-character #\# #\? #'cl-interpol::interpol-reader))

This code is equivalent to:

    (defvar interpol-syntax
        `((:dispatch-macro-character #\# #\? ,#'cl-interpol::interpol-reader)))

If you don't want to use `defsyntax` in some reasons, use this code
instead.

### Macro: `use-syntax`

    use-syntax syntax-to-use

`use-syntax` enables the syntax specified by
`syntax-to-use`. `syntax-to-use` is a symbol which is defined by
`defsyntax`.

Here is an example:

    ;; use cl-interpol syntax defined before
    (use-syntax interpol-syntax)

----

Copyright (C) 2011-2015  Tomohiro Matsuyama <<m2ym.pub@gmail.com>>
