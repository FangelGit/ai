(deftemplate person
  (slot name (type STRING))
  (slot surname (type STRING)))

(deftemplate question
    (slot text (type STRING))
    (multislot valid-answers (type STRING))
)

(deftemplate answer
    (slot to-question (type STRING))
    (slot answer-given (type STRING))
)

(deffacts baza
    (person (name "John") (surname "Doe"))
    (question (text "Test1") (valid-answers "Yes" "No"))
    (question (text "Test2") (valid-answers "Yes" "No"))
)

(defrule answer1
    (answer (to-question "Test1") (answer-given "Yes"))
    ?x <- (question (text "Test1") (valid-answers "Yes" "No"))
    =>
    (retract ?x)
)