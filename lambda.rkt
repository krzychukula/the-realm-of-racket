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

(define (my-andmap pred lst)
  (cond
    [(empty? lst)
     ;;this looks to me as a bug in the book
     #t]
    [else
     (and
      (pred (first lst))
      (my-andmap pred (rest lst)))]))

(my-andmap number? empty)
;; #t
(my-ormap number? empty)
;; #f