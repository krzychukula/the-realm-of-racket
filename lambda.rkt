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



(define (my-foldr f base lst)
  (cond
    [(empty? lst)
     base]
    [else
     (f (first lst)
        (my-foldr f base (rest lst)))]))

(my-foldr + 0 '(1 2 3))
;; 6

(define (my-foldl f base lst)
  (cond
    [(empty? lst)
     base]
    [else
     (my-foldl f
               (f (first lst) base)
               (rest lst))]))

(my-foldl cons empty '(a b c))
;; '(c b a)
(my-foldr cons empty '(a b c))
;; '(a b c)


(define (my-build-list n f)
  (define (builder k)
    (cond
      [(= n k)
       empty]
      [else
       (cons
        (f k)
        (builder (add1 k)))]))
  (builder 0))

(my-build-list 5 add1)
;; '(1 2 3 4 5)
(my-build-list 10 (lambda (n) (* n 2)))
;; '(0 2 4 6 8 10 12 14 16 18)