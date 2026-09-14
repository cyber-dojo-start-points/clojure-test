(ns answer-size-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest the-answer-has-two-digits
  (is (= 2 (count (str (answer))))))
