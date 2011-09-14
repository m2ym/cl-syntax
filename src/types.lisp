(in-package :cl-syntax)

(deftype syntax () 'readtable)

(deftype syntax-designator ()
  '(or syntax
       package-designator
       named-readtable-designator))
