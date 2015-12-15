#lang racket

(struct monster ([health #:mutable]))

(struct orc monster (club))

(define my-orc (orc 20 10))
(monster-health my-orc)
;; 20
(orc-club my-orc)
;; 10
(set-monster-health! my-orc 5)
(monster-health my-orc)
;; 5