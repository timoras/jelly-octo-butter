#lang scheme
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
 
(list 'old 'superold (list 'old) 'aa 'eee (list 'aa 'old))
(insertR* 'new 'old  (list 'old 'superold (list 'old) 'aa 'eee (list 'aa 'old)))

(define occur*
  (lambda (a l)
    ))