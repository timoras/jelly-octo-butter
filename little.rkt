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

(define meat 'meat)
(define potato 'potato)
(define mashed 'mashed)

(define rember
  (lambda (a lat)
    (cond 
      ((null? lat) '())
      ((eq? a (car lat)) (cdr lat))
      (else (cons (car lat) (rember a (cdr lat)))))))

(rember meat '(meat mashed potato))
(rember meat '(mashed meat potato))
(rember meat '(mashed potato meat))
(rember meat '(mashed meat potato meat))
