#lang racket

(define (superfib n ) 
  (if (< n 3) 
      n 
      (+ 
       (superfib (- n 1))
       (* 2 (superfib (- n 2)))
       (* 3 (superfib (- n 3)))
       ))
  )

(define (fib2 n) 
  (if (< n 3)
      n 
  (fib2-iter 0 1 2 (- n 2))))

(define (fib2-iter f1 f2 f3 count) 
  (define sum (+ f3 (* 2 f2) (* 3 f1)))
  (if (= count 0) f3
      (fib2-iter f2 f3 sum (- count 1))
      )
  )
  
(define lim 8)
  
(superfib lim)
(fib2 lim)