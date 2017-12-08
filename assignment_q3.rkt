 #lang racket
(provide leftChild)
(provide rightChild)
(provide value)
(provide sorted)
(provide itemExists)
(provide treeSort)
(provide insertItem)
(provide insertList)
(provide inOrder)


;Defining the structure of the BST
  (define (leftChild BST)
        (car BST))
  (define (rightChild BST)
    (caddr BST))
  (define (value BST)
    (cadr BST))
  
  (define inOrder
    (match-lambda
      [`(() ,el ()) `(,el)]
      [`(,left ,el ()) (append (inOrder left) `(,el))]
      [`(() ,el ,right) (append `(,el) (inOrder right))]
      [`(,left ,el ,right) (append (inOrder left) `(,el) (inOrder right))]))
  
;Part (A)
  (define (sorted BST);
   (begin
     (cond [(not (empty?(leftChild BST))) (sorted (leftChild BST))])
     (printf "~a " (value BST));
     (cond [(not (empty?(rightChild BST))) (sorted (rightChild BST))])))

;Part (B)
   (define (itemExists item BST)
      (cond
        [(null? BST) #f]
        [(equal? item (value BST)) #t] 
        [(< item (value BST)) (itemExists item (leftChild BST))]
        [(> item (value BST)) (itemExists item (rightChild BST))]))
    
;Part (C)
    (define insertItem
         (match-lambda**
          [(el '()) `(() ,el ())]
          [(el '(() () ())) `(() ,el ())] 
          [(el `(,left ,item ,right)) #:when (<= el item) `(,(insertItem el left) ,item ,right)]
          [(el `(,left ,item ,right)) `(,left ,item ,(insertItem el right))]))
      
;Part (D)
    (define 
      (insertList BST leaf)
      (if (empty? leaf) BST
          (insertList (insertItem BST (car leaf)) (cdr leaf))))
      
;Part (E)
      (define (treeSort lst)
        (define treeSortItration
          (match-lambda**
           [(el `()) (inOrder el)]
           [(el `(,a . ,b)) (treeSortItration (insertItem a el) b)]
           [(_ _) "incorrect arguments or broken tree"]))
        (treeSortItration '(() () ()) lst))

      ;Sample test list
      (display "Q3 Sample Tree")
      (treeSort '(5 2 7 91 5 12 29 4 6))

