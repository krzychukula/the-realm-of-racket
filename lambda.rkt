#lang racket

(define (my-map func lst)
  (cond
    [(empty? lst) empty]
    [else (cons (func (first lst))
                (my-map func (rest lst)))]))

(my-map add1 '(1 2 3 4))

;;(define (rot goos)
;;  (my-map (lambda (f)
;;            (goo (goo-loc f) (sub1 (goo-expire f))))
;;          goos))

((lambda (num) (- num 2)) 5)
