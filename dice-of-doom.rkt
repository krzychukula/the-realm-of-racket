#lang racket

(struct dice-world (src baord gt))

(struct territory (index player dice x y))

(struct game (board player moves))

(struct move (action gt))

;; example states of the board
(define b0 (list (territory 0 0 2 'x 'y) (territory 1 1 1 'a 'b)))
(define b1 (list (territory 0 0 1 'x 'y) (territory 1 0 1 'a 'b)))
(define b2 (list (territory 1 0 1 'a 'b) (territory 0 0 1 'x 'y)))
;;game tree with the final board
(define gt2 (game b2 1 '()))

(define mv1 (move '() gt2))
(define gt1 (game b2 0 (list mv1)))

(define mv0 (move '(0 1) gt1))
(define gt0 (game b0 0 (list mv0)))