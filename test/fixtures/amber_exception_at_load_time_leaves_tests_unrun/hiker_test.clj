(ns hiker-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(def hikers-share (/ (answer) 0))

(deftest life-the-universe-and-everything
  (is (= 42 (answer))))

(deftest the-answer-is-even
  (is (even? (answer))))
