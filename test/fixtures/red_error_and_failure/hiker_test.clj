(ns hiker-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest life-the-universe-and-everything
  (is (= 54 (answer))))

(deftest the-answer-shared-between-no-hikers
  (is (= 42 (share 0))))
