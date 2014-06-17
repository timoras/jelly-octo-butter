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

(define firsts 
  (lambda (l)
    (cond 
      ((null? l) '())
      ((null? (car l)) (cons '() (firsts (cdr l))))
      (else (cons (car(car l)) (firsts (cdr l)))))))

(define insertR
  (lambda (new old lat)
    (cond 
      ((null? lat) '())
      (else 
       (cons 
        (car lat)
        (cond 
          ((eq? (car lat) old) (cons new (cdr lat)))
          (else (insertR new old (cdr lat)))))))))

(define insertL
  (lambda (new old lat)
    (cond 
      ((null? lat) '())
      (else 
       
        (cond 
          ((eq? (car lat) old) (cons new lat))
          (else (cons (car lat) (insertL new old (cdr lat)))))))))

(insertR 1 2 '(1 2 3))
(insertL 1 233 '(1 2 3))