(defvar days-per-month)
(defvar sunday-counter)
(defvar first-sunday)
(defvar current-date)

(defparameter *sunday-counter* (let ((count 0))
                                    (list #'(lambda() (setf count (+ count 1)))
                                          #'(lambda() (setf count (- count 1)))
                                          #'(lambda() count))))


(defun increase-counter (counter)
    (funcall (car counter)))


(defun decrease-counter (counter)
    (funcall (car (cdr counter))))


(defun get-counter (counter)
    (funcall (car (cddr counter))))


(defun days-in-february (year)
    (cond ((null year) nil)
          ((= 1900 year) 28)
          ((= (mod year 4) 0) 29)
          (t 28)))


(defun get-month (date-tuple)
    (nth 0 date-tuple))


(defun get-day (date-tuple)
    (nth 1 date-tuple))


(defun get-year (date-tuple)
    (nth 2 date-tuple))


(defun get-days-in-month (month year)
    (if (= 1 month) (days-in-february year)
        (nth month days-per-month)))


(defun build-date (month day year)
    (setf correct-day day)
    (setf correct-month month)
    (setf correct-year year)
    (let ((days-in-month (get-days-in-month month year)))
        (if (> day days-in-month) (and (setf correct-day (- day days-in-month)) (setf correct-month (+ 1 month)))
            (setf correct-day day))
        (if (> correct-month 11) (and (setf correct-month (- month 11)) (setf correct-year (+ 1 year)))
            (setf correct-month correct-month))
        (list correct-month correct-day correct-year)))


(defun add-days (days date)
    (build-date (get-month date) (+ days (get-day date)) (get-year date)))


(setf days-per-month '(31 0 31 30 31 30 31 31 30 31 30 31))
(setf sunday-counter 0)
(setf first-sunday (build-date 00 06 1901))
(setf current-date first-sunday)

(loop while (> 2001 (get-year current-date))
    do (setf current-date (add-days 7 current-date))
    (format t "~a~%" current-date)
    (if (= 1 (get-day current-date)) (increase-counter *sunday-counter*) nil))

(format t "~D~%" (get-counter *sunday-counter*))
