#lang sicp

; Ex. 1.2

(define uppper-first-expr (+ 6 (/ 4 5)))
(define upper-second-expr (- 3 uppper-first-expr))
(define upper-third-expr (- 2 upper-second-expr))
(define upper-expr (+ 5 4 upper-third-expr))

(define lower-first-expr (- 6 2))
(define lower-second-expr (- 2 7))
(define lower-expr (* 3 lower-first-expr lower-second-expr))

(define expr-result (/ upper-expr lower-expr))

; Ex. 1.3

(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (get-two-biggest x y z)
   (cond
     ((and (>= x z) (>= y z)) (list x y))
     ((and (>= y x) (>= z x)) (list y z))
     ((and (>= x y) (>= z y)) (list x z))))
      

(apply sum-of-squares (get-two-biggest 2 3 4))