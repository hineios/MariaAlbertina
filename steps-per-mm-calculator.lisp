(in-package :cl-user)

;; E0 100mm
;; steps/mm - 97
;; 105.01 mm
;; 105.72 mm
;; 105.80 mm
;; avg 105.54 mm

;; 105.54 mm - 97 steps/mm
;; 100 mm    - x  steps/mm

(defparameter *steps/mm* 146.8143)
(defparameter *extrude-distance-mm* 100)

(defun avg (&rest numbers)
  (if (null numbers)
      (error "empty list of numbers to make avg")
      (/ (reduce #'+ numbers)
         (length numbers))))

;; a - b
;; c - x
;; x = (c * b)/a
(defun rule-of-three (a b c)
  (/ (* c b)
     a))

(defun calculate-new-steps-per-mm (&rest current-distances)
  (setf *steps/mm* (rule-of-three (apply #'avg current-distances) *steps/mm* *extrude-distance-mm*)))
