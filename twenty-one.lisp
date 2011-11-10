(defparameter *amicable-pairs* '())

;(defun divisors (n &optional (c 1))
;    (let ((counter c))
;        (cond ((= counter (+ 1 n)) nil)
;              ((integerp (/ n counter)) (cons (/ n counter) (divisors n (+ 1 counter))))
;              (t (divisors n (+ 1 counter))))))

(defun divisors (n)
    (loop for i from 1 to (sqrt n)
        when (= (mod n i) 0)
            collect i
            and unless (= i (/ n i))
                collect (/ n i)))

(defun sum-of-proper-divisors (n)
    (- (apply '+ (divisors n)) n))

(defun is-amicable-pair (n)
    (let ((sum-of-divisors (sum-of-proper-divisors n)))
        (cond ((and (= (sum-of-proper-divisors sum-of-divisors) n) (not (= sum-of-divisors n))) t)
              (t nil))))

(defun is-in-list (n lst)
    (cond ((null lst) nil)
          ((= n (car lst)) t)
          (t (is-in-list n (cdr lst)))))

(defun add-to-amicable-pairs (n)
    (format t "~D~%" n)
    (cond ((not (is-in-list n *amicable-pairs*)) (setf *amicable-pairs* (cons n *amicable-pairs*)))
          (t nil)))


(loop for c from 1 to 10000
      do (if (is-amicable-pair c) (add-to-amicable-pairs c) nil))

(format t "~D~%" (apply '+ *amicable-pairs*))
