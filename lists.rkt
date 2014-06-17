#lang scheme 


(define (last-element items) 
   (if (null? (cdr items))
      (car items)
      (last-element (cdr items)))
  )

(last-element (list 23 72 149 34))

(define (reverse  items) 
   (if (null? (cdr items))
       items
      (append  (reverse (cdr items))  (cons (car items) null ) ))
  )
  "dassd"
  
(cons (reverse (list 1 4 9)) null)
(reverse (list 1 4 9 16 25))

(define one-through-four (list 1 2 3 4))
(define squares  (list 1 4 9 16 25))

(append one-through-four squares)

(cdr one-through-four)
(car one-through-four)

  "dassd1"
(define (g . w) 
  list  w 
  )

(car (g 1 2 3 4 5 6))
(g 1 2 3 4 5 6)

(define (append-element list1 elem) 
  (append list1 (cons elem null)))
  
(define (same-parity first . rest)
  (define (internal-parity begin-list rest-list) 
     (if (null? rest-list) 
         begin-list
         (if (= (modulo first 2) (modulo (car rest-list) 2))
            (internal-parity (append-element begin-list (car rest-list)) (cdr rest-list))
            (internal-parity begin-list (cdr rest-list))
         )))
  (internal-parity (list first) rest)
 )

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

(map abs (list -10 2.5 -11.6 17))
(map (lambda (x) (* x x))
     (list 1 2 3 4))

(define (square-list items)
    (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))


(square-list (list 1 2 3 4))



(define x (cons (list 1 2) (list 3 4)))

(length x)
3
(count-leaves x)
4
