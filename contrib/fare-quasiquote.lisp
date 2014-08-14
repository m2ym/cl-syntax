(in-package :fare-quasiquote)

(syntax:defsyntax fare-quasiquote-mixin
  (:macro-char #\` #'read-read-time-backquote)
  (:macro-char #\, #'read-comma)
  (:macro-char #\# :dispatch)
  (:dispatch-macro-char #\# #\( #'read-hash-paren))

(syntax:define-package-syntax :fare-quasiquote
    (:fuze :standard fare-quasiquote-mixin))
