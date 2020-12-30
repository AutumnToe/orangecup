#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define background (empty-scene 600 600)) 

(define redball (circle 11 "solid" "red"))

(define-struct state [ y velocity])
 
(define (draw s)
  (place-image redball 150 (state-y s) background))

(define (new-y s)
  (+ (state-y s) (state-velocity s)))

(define (new-velocity s)
  (+ (state-velocity s) 1.5))

(define (bounce s)
  (* (state-velocity s) -.5))
  
(define (tick s)
  (cond [(and (>= (abs (state-velocity s)) 2) (>= (state-y s) 600))
         (make-state 599 (bounce s))]
        [else (make-state (new-y s) (new-velocity s))]))

(define (main s)
  (big-bang s
    [to-draw draw]
    [on-tick tick]))

(main (make-state 150 -20))






