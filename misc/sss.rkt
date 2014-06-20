#lang scheme
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (compose f g)
  (lambda (x) (f (g x)))) 
((compose square inc) 6)

(define (repeated f n)
  (if (< 1 n) 
      (compose f (repeated f (- n 1)))
      (lambda (x) (f x)))
  )

((repeated square 1) 5)

(define  (f g) 
  (g 2)
  )
(f f)