#lang racket

(struct example (x y z))
(define ex1 (example 1 2 3))
ex1

(struct example2 (p q r) #:transparent)
(define ex2 (example2 9 8 7))
ex2

#|
Result:
#<example>
(example2 9 8 7)

|#