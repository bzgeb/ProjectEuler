(defun factorial (n)
    (cond ((= 0 n) 1)
          (t (* n (factorial (- n 1))))))

(defun string-to-list (a-string)
    (cond ((= 0 (length a-string)) nil)
          (t (cons (parse-integer (subseq a-string 0 1)) (string-to-list (subseq a-string 1))))))

(format t "~a~%" (apply '+ (string-to-list (write-to-string (factorial 100)))))
