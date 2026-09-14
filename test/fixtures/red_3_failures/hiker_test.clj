(ns hiker-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest life-the-universe-and-everything
  (is (= 42 (answer))))

(deftest the-answer-is-a-multiple-of-seven
  (is (= 0 (mod (answer) 7))))

(deftest the-answer-has-two-digits
  (is (= 2 (answer-size))))
