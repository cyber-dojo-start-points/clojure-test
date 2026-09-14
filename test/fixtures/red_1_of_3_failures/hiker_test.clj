(ns hiker-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest life-the-universe-and-everything
  (is (= 42 (answer))))

(deftest the-answer-is-even
  (is (even? (answer))))

(deftest the-answer-has-two-digits
  (is (= 2 (answer-size))))
