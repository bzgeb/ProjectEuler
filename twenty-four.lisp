(defparameter *count* 0)

(defun count-and-nil ()
    (setf *count* (+ 1 *count*))
    '(()))

(defun permutations (bag)
    "Return a list of all the permutations of the input."
    ;; If the input is nil, there is only one permutation:
    ;; nil itself
    (if (or (null bag) (> *count* 1000000))
        (count-and-nil)
        ;; Otherwise, take an element, e, out of the bag.
        ;; Generate all permutations of the remaining elements,
        ;; And add e to the front of each of these.
        ;; Do this for all possible e to generate all permutations.
        (mapcan #'(lambda (e)
            (mapcar #'(lambda (p) (cons e p))
                (permutations
                    (remove e bag :count 1))))
                        bag)))

(format t "~a~%" (permutations '(0 1 2 3 4 5 6 7 8 9)))
(format t "Count: ~D~%" *count*)

