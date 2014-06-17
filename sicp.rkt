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
(define (double f) 
  (lambda (x) (f (f x))))
(inc 3)

((double inc) 3)
(((double (double double)) inc) 5)


;Consider the problem of representing line segments in a plane. 
;Each segment is represented as a pair of points: a starting point and an ending point.
;Define a constructor make-segment and selectors start-segment and end-segment that define the representation of segments in terms of points. 

(define (a) (cons (cons 1 2) (cons 3 4)))
(print 'lllll) (newline)
(a)

(define (make-segment start end) (cons start end))

(define (start-segment segment) (cdr segment))
(define (end-segment segment) (car segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(x-point (make-point 3 5))
(y-point (make-point 3 5))
(define (midpoint-segment segment) 
  (make-point
   (/ (+ (x-point(start-segment segment)) (x-point(end-segment segment))) 2)
   (/ (+ (y-point(start-segment segment)) (y-point(end-segment segment))) 2)
   ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 1 1) (make-point 3 4))))
(print-point (midpoint-segment (make-segment (make-point 1 1) (make-point 5 5))))