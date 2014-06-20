#lang scheme
(define inc1 
  (lambda (x)
    (+ x 1)))

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define rember* 
  (lambda (a l)   
    (cond
      ((null? l) '())
      ((pair? (car l)) (cons (rember* a (car l)) (rember* a (cdr l))))
      ((eq? (car l) a) (rember* a (cdr l)))
      (else (cons (car l) (rember* a (cdr l)))))))

(define insertR* 
  (lambda (new old l) 
    (cond 
      ((null? l) '())
      ((atom? (car l))
       (cond 
         ((eq? (car l) old) 
          (cons (car l) (cons new (insertR* new old (cdr l)))))
         (else (cons (car l) (insertR* new old (cdr l))))))      
      (else (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))


(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond 
         ((eq? (car l) a) (inc1 (occur* a (cdr l))))
         (else (occur* a (cdr l)))))
      (else (+ (occur* a (car l)) (occur* a (cdr l)))))))

(define member*
  (lambda (a l)
    (cond
      ((null? l) false)
      ((atom? (car l))
       (cond 
         ((eq? (car l) a) true)
         (else (member* a (cdr l)))))
      (else (or (member* a (car l)) (member* a (cdr l)))))))


(define numbered?
  (lambda (aexp)
    (cond 
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) (quote +)) (and (numbered? (car aexp)) (numbered? (caddr aexp))))
      ((eq? (car (cdr aexp)) (quote *)) (and (numbered? (car aexp)) (numbered? (caddr aexp)))) 
      (else false))))

(define value 
  (lambda (nexp) 
    (cond 
      ((atom? nexp) nexp)
      ((eq? (cadr nexp) (quote +)) (+ (value (car nexp)) (value (caddr nexp))))
      (else (* (value (car nexp)) (value (caddr nexp)))))))
