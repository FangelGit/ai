(deftemplate person
  (slot name (type STRING))
  (slot surname (type STRING)))


(deftemplate answer
    (slot to-question (type STRING))
    (slot answer-given (type STRING))
)

(deffacts baza
    (person (name "John") (surname "Doe"))
)



(defrule hello-world
  "Greet a new person."
  (person (name ?name) (surname ?surname))
  =>
  (println "Hello " ?name " " ?surname))