#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define background (empty-scene 600 600)) 

(define redball (circle 11 "solid" "red"))

(define-struct state [ y velocity])
 
(define (draw s)
  (place-image redball 150 (state-y s) background))

(define (tick s)
 (make-state (+ (state-y s) (state-velocity s)) (+ (state-velocity s) .5)))

(define (main s)
  (big-bang s
    [to-draw draw]
    [on-tick tick]))

(main (make-state 150 -20))






