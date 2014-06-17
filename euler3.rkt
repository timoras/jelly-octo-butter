#lang racket


(define (is_prime number) 
  (define (iter_to_sqrt counter)
    (define sq (* counter counter))
    (if (> sq number)
        1
        (if (= (remainder number counter) 0)
           0
           (iter_to_sqrt (+ counter 2))
            )
        )) 
  (if (= number 2)
      2  
      (iter_to_sqrt 3))
  )  

(define (getmax_factor max_limit )  
  (define (iter_to_sqrt counter max_till_now)
    (define sq (* counter counter))
    (if (> sq max_limit)
        (if (= max_till_now 0) 
            max_limit
            max_till_now)        
        (if (and (= (remainder max_limit counter) 0) (= (is_prime counter) 1))
            (iter_to_sqrt (+ counter 1) counter)
            (iter_to_sqrt (+ counter 1) max_till_now)
            )
        ))
  (iter_to_sqrt 2 0)
  )

(getmax_factor 600851475143)
(is_prime 109)
