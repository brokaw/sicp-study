;;; Exercise 1.16.
;; Design a procedure that evolves an iterative
;; exponentiation process that uses successive squaring
;; and uses a logarithmic number of steps,
;; as does fast-expt.
(define (fast-iter-expt x y)
  (define (fast-helper result base exp)
    (cond ((= 0 exp) result)
	  ((odd? exp) (fast-helper (* base result) base (- exp 1)))
	  ((even? exp) (fast-helper result (* base base) (/ exp 2)))))
  (fast-helper 1 x y))