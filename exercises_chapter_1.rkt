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

; Ex. 1.7

(define precision 0.000001)

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) precision))

(define (sqrt x)
  (define (sqrt-iter guess previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess)
                   guess)))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0 0))

(sqrt 78)

; Ex. 1.8

(define (cube-root x)
  (define (cube-iter guess previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (cube-iter (cube-improve guess)
                   guess)))
  (define (cube-improve guess)
    (/ (+ (/ x (square guess)) (* guess 2)) 3))
  (cube-iter 1.0 0))

(cube-root 79)