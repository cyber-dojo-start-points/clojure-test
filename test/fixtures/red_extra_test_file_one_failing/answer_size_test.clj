(ns answer-size-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest the-answer-has-three-digits
  (is (= 3 (count (str (answer))))))
