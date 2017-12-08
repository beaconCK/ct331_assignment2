#lang racket
(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

(define (ins_beg el symbol)
  (display "Hello, I'm ins_beg!\n")
  (cons el symbol))

(define (ins_end el symbol)
  (display "Hello, I'm ins_end!\n")
  (append symbol (list el)))

(define (cout_top_level list)
  (display "Hello, I'm cout_top_level!\n")
  (define lst_el 0)
  (define (count symbol)
    (if (empty? symbol)
        (display "Finished counting elements! = ")
        (begin
          (set! lst_el (+ lst_el 1))
          (count (rest symbol)))))
  (count list)
  (display lst_el))   

(define (count_instances el list)
  (display "Hello I'm count_instances!\n")
  (define lst_el 0)
  (define (count symbol)
    (if (empty? symbol)
        (display "Finished counting instances! = ")
        (begin
          (if (eq? el (first symbol))
              (set! lst_el (+ lst_el 1))
          (set! lst_el lst_el))
          (count (rest symbol)))))
  (count list)
  (display lst_el))
  

(define (count_instances_tr el list)
  (display "Hello I'm count_instances_tr!\n")
  (define (count_tr symbol totalSymbol)
  (if (empty? symbol)
      (begin
        (display "Finished counting instances! = ")
        (display totalSymbol))
      (begin
        (if (eq? el(first symbol))
            (count_tr (rest symbol) (+ totalSymbol 1))
            (count_tr (rest symbol) totalSymbol)))))
  (count_tr list 0))


  ;I tried to run this function using characters like the rest, but kept getting error unless I use numbers
  ;if you dont mind I will like to know how to refoctor this function to run with characters (just for the future)
(define (count_instances_deep el list)
  (display "Hello I'm count_instances_tr!\n")
  (define lst_el 0)
  (define (count symbol)
    (if (empty? symbol)
        (void)
        (begin
          (if (eq? el (first symbol))
              (begin
                (set! lst_el (+ lst_el 1))
                (count (rest symbol)))
          (begin
            (if (number? (first symbol))
                (count (rest symbol))
                 (begin
                   (count (first symbol))
                   (count (rest symbol)))))))))
  
  (count list)
  (display "Finished counting instances! = ")
  (display lst_el))
 