#lang racket
;// 89

(define (a number) 
  (* number 5)
  )

(define (polindrome? number) 
  (
   let ( 
        (l1 (remainder number 10))
        (l2 (remainder (quotient number 10) 10))
        (l3 (remainder (quotient number 100) 10))
        (l4 (remainder (quotient number 1000) 10))
        (l5 (remainder (quotient number 10000) 10))
        (l6 (remainder (quotient number 100000) 10))
        )
    (if (and (= l1 l6) (= l2 l5) (= l3 l4))
        number 0)
    ))
( define (inc x) (+ x 1))


(define (doit x x-max dx)
  (if (<= x x-max)
    (begin
      (x)
      (doit (+ x dx) x-max dx))))

(doit a b dx) ; 


(define (iter counter max f)
  (cond ((< counter max) 
         (f counter) 
         (iter (inc counter) max f))
        )
  )




(iter 0 6 (iter 0 6 ))