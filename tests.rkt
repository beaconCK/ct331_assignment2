#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a\n" (ins_beg "a" '("b" "c" "d")))
    (printf "2: ~a\n" (ins_end "a" '("b" "c" "d")))
    (printf "3: ") (cout_top_level '("a" '("b" "c" "d") "c"))
    (printf "\n4: ") (count_instances "e" '("e" "f" "g" "e" "g" "h" "e" "f" "g" "e"))
    (printf "\n5: ") (count_instances_tr "c" '("a" "b" "c" "a" "c" "d" "a" "b" "c" "d" "a" "e" "c"))
    (printf "\n6: ") (count_instances_deep 3 '( 1 2 3 (1 3 4) 1 2 3 1 3 6 3 5 3))
    
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (eq? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

;End test functions

;Run the tests
(runTests)