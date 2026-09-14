(ns hiker-test
  (:require [clojure.test :refer :all]
            [hiker :refer :all]))

(deftest the-answer-shared-between-no-hikers
  (is (= 42 (share 0))))
