#lang racket

(struct record (name score) #:transparent)
  

(define (winners lst pred)
  (cond
    [(empty? lst) (list pred)]
    [else
     (define fst (first lst))
     ;;no idea how it's supposed to work
     (if (> (record-score pred) (record-score fst))
         (list pred)
         (cons pred (winners (rest lst) fst)))]))

(winners (list (record "Janek" 20) (record "almost" 60)) (record "winner" 50))