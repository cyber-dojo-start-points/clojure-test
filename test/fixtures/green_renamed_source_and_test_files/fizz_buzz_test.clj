(ns fizz-buzz-test
  (:require [clojure.test :refer :all]
            [fizz-buzz :refer :all]))

(deftest a-number-is-itself
  (is (= "1" (fizz-buzz 1))))

(deftest a-multiple-of-three-is-fizz
  (is (= "Fizz" (fizz-buzz 6))))

(deftest a-multiple-of-five-is-buzz
  (is (= "Buzz" (fizz-buzz 10))))

(deftest a-multiple-of-fifteen-is-fizzbuzz
  (is (= "FizzBuzz" (fizz-buzz 30))))
