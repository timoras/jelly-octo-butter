#lang racket

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
(define multirember
  (lambda (a lat)
    (cond 
      ((null? lat) '())
      ((eq? a (car lat)) (multirember a (cdr lat)))
      (else (cons (car lat) (multirember a (cdr lat)))))))

(define set? 
  (lambda (lat)
    (cond 
      ((null? lat) true)
      ((member? (car lat) (cdr lat)) false)
      (else (set? (cdr lat))))))

(define makeset
  (lambda (lat)
    (cond 
      ((null? lat) '())      
      (else (cons 
             (car lat) 
             (makeset(multirember(car lat) (cdr lat))))))))

(define subset 
  (lambda (set1 set2)
    (cond 
      ((null? set1) true)
      (else (and (member? (car set1) set2) (subset (cdr set1) set2))))))
      
  