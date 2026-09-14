(ns hiker)

(defn answer []
    (loop [i 0 total 0]
      (if (= i 6)
        total
        (recur i (+ total 9)))))
