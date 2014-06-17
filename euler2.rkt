#lang scheme

(define max_number  4000000 );
(define (next_fibonacci a1 a2) (+ a1 a2));

(define (is_even number) (if (= (modulo number 2) 0) number 0))

(define (sum_even previous number) 
  (
   if (< number max_number)
       ( + (is_even number) (sum_even number (next_fibonacci previous number)) ) 
       0
   )
  );

(define a (sum_even 1 1));
a;
555;