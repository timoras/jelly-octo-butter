#lang scheme

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat? 
  (lambda (x)
    (cond
      ((null? x) true)
      ((atom? (car x)) (lat? (cdr x)))
      (else false))))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) false)
      (else (or (eq? a (car lat)) (member? a (cdr lat)))))))

(define inc1 (lambda (x) (+ x 1)))
(define add1 (lambda (x) (+ x 1)))
(define sub1 (lambda (x) (- x 1)))
