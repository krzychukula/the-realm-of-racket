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

(define (my-filter pred lst)
  (cond
    [(empty? lst) empty]
    [(pred (first lst))
     (cond (first lst)
           (my-filter pred (rest lst)))]
    [else (my-filter pred (rest lst))]))

(define (my-ormap pred lst)
  (cond
    [(empty? lst) #f]
    [else (or (pred (first lst))
              (my-ormap pred (rest lst)))]))

