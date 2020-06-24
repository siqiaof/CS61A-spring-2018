;; Extra Scheme Questions ;;


; Q5
(define lst
  'YOUR-CODE-HERE
)

; Q6
(define (composed f g)
  (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
  (if  (null? lst)
       ()
       (if  (= item (car lst))
            (remove item (cdr lst))
            (cons (car lst) (remove item (cdr lst)))
       )
))


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (gcd a b)
  (if  (= 0 (min a b))
       (max a b)
       (if  (= 0 (remainder (max a b) (min a b)) )
            (min a b)
            (gcd (min a b) (remainder (max a b) (min a b)))
       )
  )
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q9
(define (in? x s) (cond ((null? s) #f) ((= (car s) x) #t) (else (in? x (cdr s)))))
(define (no-repeats s)
  (cond ((null? s) ()) ((in? (car s) (no-repeats (cdr s))) (no-repeats (cdr s))) (else (cons (car s) (no-repeats (cdr s)))))
)

; Q10
(define (substitute s old new)
  (cond 	((null? s) ()) 
	((eq? (car s) old) (cons new (substitute (cdr s) old new)))
	((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new))) 
	(else (cons (car s) (substitute (cdr s) old new)))
))

; Q11
(define (sub-all s olds news)
  (if (null? (cdr olds)) 
      (substitute s (car olds) (car news))
      (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
))