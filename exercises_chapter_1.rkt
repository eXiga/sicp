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

; Fibonacci

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(fib 10)

; Money count

(define (count-change amount number-of-coins)
  (define (cc amount number-of-coins) 
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= number-of-coins 0)) 0)
          (else (+ (cc amount
                       (- number-of-coins 1))
                   (cc (- amount
                          (highest-coin number-of-coins))
                       number-of-coins)))))
  (define (highest-coin number-of-coins)
    (cond ((= number-of-coins 1) 1)
          ((= number-of-coins 2) 5)
          ((= number-of-coins 3) 10)
          ((= number-of-coins 4) 25)
          ((= number-of-coins 5) 50)))
  (cc amount number-of-coins))

;(count-change 100 5)

; Ex. 1.11

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (f-recur (- n 2))
         (f-recur (- n 3)))))

(define (f-iter count)
  (define (f a b c count)
    (if (= count 0)
        c
        (f-iter (+ a b c) a b (- count 1))))
  (f 2 1 0 count))

; (f-recur 5) = 11
(f-iter 11)



