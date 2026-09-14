(ns hiker-test
  (:require [clojure.test :refer :all]
            [sums.checksum :refer :all]
            [hiker :refer :all]))

(deftest life-the-universe-and-everything
  (is (= 42 (answer))))

(deftest the-digits-of-the-answer-add-up-to-six
  (is (= 6 (checksum (answer)))))
