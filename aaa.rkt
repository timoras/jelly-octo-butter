#lang scheme

(define (sum1 number max_limit) 
  (if (>= number max_limit) 
     0        
     (+ number (sum1 (+ number 1) max_limit))
     )
  );
 (sum1 0 10)
6;

(define (dividesby number) 
  (cond ((or (=(modulo number 3) 0) (=(modulo number 5) 0) ) number)
        (else 0)));



(define (sum number max_limit) 
  (if (>= number max_limit) 
     0
     (+ (dividesby number) (sum (+ 1 number) max_limit))
     )
  );

11111111111111111111;
(sum 0 100);

11111111111111111111;

(define (p) (p));
(define (test x y)
  (if (= x 0)
      0
      y));
(test 0 (p));
