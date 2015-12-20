#lang racket

(struct foo (bar) #:transparent)
(foo 5)

(struct prefabfoo (bar) #:prefab)
(prefabfoo 5)

;; >
;; (foo 5)
;; '#s(prefabfoo 5)

