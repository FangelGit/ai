;; ****************************************************
;; ***** EMBARK ON YOUR OWN PHOTOGRAPHY ADVENTURE *****
;; ****************************************************


; show-question-9-1 i show-result-26 to są te kłopotliwe jak coś


;; *************** TEMPLATE DEFINITIONS *************** 

(deftemplate question
(slot text (type STRING))
(multislot valid-answers (type STRING))
)

(deftemplate answer
(slot answer-given (type STRING))
(slot to-question (type STRING))
)

(deftemplate result
(multislot text (type STRING))
)


;; ***************** FACT DEFINITIONS *****************

(deffacts data
(begin)
)


;; ****************** QUESTION RULES ******************

(defrule show-question-1
?x <- (begin)
=>
(retract ?x)
(assert (question (text "Do I feel like shooting today?") (valid-answers "Yes" "No")))
)

(defrule show-question-2-1
(answer (answer-given "Yes") (to-question "Do I feel like shooting today?"))
?y <- (question (text "Do I feel like shooting today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to shoot myself?") (valid-answers "Yes" "No")))
)

(defrule show-question-2-2
(answer (answer-given "No") (to-question "Do I feel like shooting today?"))
?y <- (question (text "Do I feel like shooting today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to do something photography related?") (valid-answers "Yes" "No")))
)

(defrule show-question-3-1
(answer (answer-given "Yes") (to-question "Do I want to shoot myself?"))
?y <- (question (text "Do I want to shoot myself?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want someone else to take my photo?") (valid-answers "Yes" "No")))
)

(defrule show-question-3-2
(answer (answer-given "No") (to-question "Do I want to shoot myself?"))
?y <- (question (text "Do I want to shoot myself?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Is it because I lack confidence in having my picture taken?") (valid-answers "Yes" "No")))
)

(defrule show-question-3-3
(answer (answer-given "Yes") (to-question "Do I want to do something photography related?"))
?y <- (question (text "Do I want to do something photography related?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Want to find inspiration from yourself?") (valid-answers "Yes" "No")))
)

(defrule show-question-3-4
(answer (answer-given "No") (to-question "Do I want to do something photography related?"))
?y <- (question (text "Do I want to do something photography related?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Feeling mentally active today?") (valid-answers "Yes" "No")))
)

(defrule show-question-4-1
(answer (answer-given "No") (to-question "Do I want someone else to take my photo?"))
?y <- (question (text "Do I want someone else to take my photo?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Am I feeling artistic today?") (valid-answers "Yes" "No")))
)

(defrule show-question-4-2
(answer (answer-given "Yes") (to-question "Is it because I lack confidence in having my picture taken?"))
?y <- (question (text "Is it because I lack confidence in having my picture taken?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to become more confident?") (valid-answers "Yes" "No")))
)

(defrule show-question-4-3
(answer (answer-given "No") (to-question "Is it because I lack confidence in having my picture taken?"))
?y <- (question (text "Is it because I lack confidence in having my picture taken?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Choose between where to shoot and what to shoot:") (valid-answers "Where" "What")))
)

(defrule show-question-4-4
(answer (answer-given "Yes") (to-question "Want to find inspiration from yourself?"))
?y <- (question (text "Want to find inspiration from yourself?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Feeling social today?") (valid-answers "Yes" "No")))
)

(defrule show-question-5-1
(answer (answer-given "Yes") (to-question "Do I want to become more confident?"))
?y <- (question (text "Do I want to become more confident?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography")))
)

(defrule show-message-and-question-5-1
(answer (answer-given "No") (to-question "Do I want to become more confident?"))
?y <- (question (text "Do I want to become more confident?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Your lack of confidence is holding you back from reaching your dreams. Let's work on it! 
Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography")))
)

(defrule show-question-5-2
(answer (answer-given "Where") (to-question "Choose between where to shoot and what to shoot:"))
?y <- (question (text "Choose between where to shoot and what to shoot:") (valid-answers "Where" "What"))
=>
(retract ?y)
(assert (question (text "Do I want to leave home?") (valid-answers "Yes" "No")))
)

(defrule show-question-5-3
(answer (answer-given "What") (to-question "Choose between where to shoot and what to shoot:"))
?y <- (question (text "Choose between where to shoot and what to shoot:") (valid-answers "Where" "What"))
=>
(retract ?y)
(assert (question (text "Am I up for a challenge?") (valid-answers "Yes" "No")))
)

(defrule show-question-6-1
(or (answer (answer-given "My photography") (to-question "Do I want more confidence in myself or with my photography?"))
(answer (answer-given "My photography") (to-question "Your lack of confidence is holding you back from reaching your dreams. Let's work on it! 
Do I want more confidence in myself or with my photography?")))
(or ?y <- (question (text "Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography"))
?y <- (question (text "Your lack of confidence is holding you back from reaching your dreams. Let's work on it! 
Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography")))
=>
(retract ?y)
(assert (question (text "Am I more scared of photographing strangers or what others think of my photography?") 
			(valid-answers "Strangers" "What others think")))
)

(defrule show-question-6-2
(answer (answer-given "Yes") (to-question "Do I want to leave home?"))
?y <- (question (text "Do I want to leave home?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to travel close to home?") (valid-answers "Yes" "No")))
)

(defrule show-question-6-3
(answer (answer-given "No") (to-question "Do I want to leave home?"))
?y <- (question (text "Do I want to leave home?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to photograph objects?") (valid-answers "Yes" "No")))
)

(defrule show-question-6-4
(answer (answer-given "Yes") (to-question "Am I up for a challenge?"))
?y <- (question (text "Am I up for a challenge?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Choose one topic to do opposite of what you usually do.") (valid-answers "Settings" "Color pallette" "Camera")))
)

(defrule show-question-6-5
(answer (answer-given "No") (to-question "Am I up for a challenge?"))
?y <- (question (text "Am I up for a challenge?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Choose one topic to shoot:") (valid-answers "Juxtaposition" "Graphical elements" "Emotion")))
)

(defrule show-question-7-1
(answer (answer-given "Strangers") (to-question "Am I more scared of photographing strangers or what others think of my photography?"))
?y <- (question (text "Am I more scared of photographing strangers or what others think of my photography?") 
		(valid-answers "Strangers" "What others think"))
=>
(retract ?y)
(assert (question (text "Want to jump in head first?") (valid-answers "Yes" "No")))
)

(defrule show-question-7-2
(answer (answer-given "What others think") (to-question "Am I more scared of photographing strangers or what others think of my photography?"))
?y <- (question (text "Am I more scared of photographing strangers or what others think of my photography?") 
		(valid-answers "Strangers" "What others think"))
=>
(retract ?y)
(assert (question (text "Is it because sharing my photos scares me or from the lack of 'likes'?") (valid-answers "Sharing" "Lack of likes")))
)

(defrule show-question-7-3
(answer (answer-given "Yes") (to-question "Do I want to travel close to home?"))
?y <- (question (text "Do I want to travel close to home?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to stay within walking distance?") (valid-answers "Yes" "No")))
)

(defrule show-question-7-4
(answer (answer-given "No") (to-question "Do I want to travel close to home?"))
?y <- (question (text "Do I want to travel close to home?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to go overseas?") (valid-answers "Yes" "No")))
)

(defrule show-question-7-5
(answer (answer-given "Settings") (to-question "Choose one topic to do opposite of what you usually do."))
?y <- (question (text "Choose one topic to do opposite of what you usually do.") (valid-answers "Settings" "Color pallette" "Camera"))
=>
(retract ?y)
(assert (question (text "Do I usually shoot from a far distance?") (valid-answers "Yes" "No")))
)

(defrule show-question-7-6
(answer (answer-given "Camera") (to-question "Choose one topic to do opposite of what you usually do."))
?y <- (question (text "Choose one topic to do opposite of what you usually do.") (valid-answers "Settings" "Color pallette" "Camera"))
=>
(retract ?y)
(assert (question (text "Am I feeling retro today?") (valid-answers "Yes" "No")))
)

(defrule show-question-7-7
(answer (answer-given "Graphical elements") (to-question "Choose one topic to shoot:"))
?y <- (question (text "Choose one topic to shoot:") (valid-answers "Juxtaposition" "Graphical elements" "Emotion"))
=>
(retract ?y)
(assert (question (text "Do I want to concentrate on composition or shooting shapes?") (valid-answers "Composition" "Shapes")))
)

(defrule show-question-7-8
(answer (answer-given "Emotion") (to-question "Choose one topic to shoot:"))
?y <- (question (text "Choose one topic to shoot:") (valid-answers "Juxtaposition" "Graphical elements" "Emotion"))
=>
(retract ?y)
(assert (question (text "Choose between face and body:") (valid-answers "Face" "Body")))
)

(defrule show-question-8-1
(answer (answer-given "Yes") (to-question "Want to jump in head first?"))
?y <- (question (text "Want to jump in head first?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to converse with the subjects?") (valid-answers "Yes" "No")))
)

(defrule show-question-8-2
(answer (answer-given "No") (to-question "Want to jump in head first?"))
?y <- (question (text "Want to jump in head first?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Do I want to be closer or further from the subject(s)?") (valid-answers "Closer" "Further")))
)

(defrule show-question-8-3
(answer (answer-given "Yes") (to-question "Am I feeling retro today?"))
?y <- (question (text "Am I feeling retro today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Am I patient?") (valid-answers "Yes" "No")))
)

(defrule show-question-8-4
(answer (answer-given "Composition") (to-question "Do I want to concentrate on composition or shooting shapes?"))
?y <- (question (text "Do I want to concentrate on composition or shooting shapes?") (valid-answers "Composition" "Shapes"))
=>
(retract ?y)
(assert (question (text "Do I want to shoot traidtional compositions?") (valid-answers "Yes" "No")))
)

(defrule show-question-9-1
(answer (answer-given "Okay") (to-question "Ask strangers to make their portrait. Keep asking until you get 10 people to say 'yes'."))
?y <- (question (text "Ask strangers to make their portrait. Keep asking until you get 10 people to say 'yes'.") (valid-answers "Okay"))
=>
(retract ?y)
(assert (question (text "Ready to take it to the next step?") (valid-answers "Yes" "No")))
)


;; ****************** RESULT RULES *******************

(defrule show-result-1
(answer (answer-given "Yes") (to-question "Do I want someone else to take my photo?"))
?y <- (question (text "Do I want someone else to take my photo?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Ask a friend, partner, or a family member to make portraits of you.")))
(assert (end))
)

(defrule show-result-2
(answer (answer-given "No") (to-question "Want to find inspiration from yourself?"))
?y <- (question (text "Want to find inspiration from yourself?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Study the masters of photography: 
Josef Koudelka
Henri Cartier-Bresson
Richard Avedon")))
(assert (end))
)

(defrule show-result-3
(answer (answer-given "Yes") (to-question "Feeling mentally active today?"))
?y <- (question (text "Feeling mentally active today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Cross-pollinate your interests with music, drawing, writing, or other hobbies.")))
(assert (end))
)

(defrule show-result-4
(answer (answer-given "No") (to-question "Feeling mentally active today?"))
?y <- (question (text "Feeling mentally active today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Take a walk around the block. Just look around and do not make any photos.")))
(assert (end))
)

(defrule show-result-5
(answer (answer-given "Yes") (to-question "Am I feeling artistic today?"))
?y <- (question (text "Am I feeling artistic today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Shoot your own shadow.")))
(assert (end))
)

(defrule show-result-6
(answer (answer-given "No") (to-question "Am I feeling artistic today?"))
?y <- (question (text "Am I feeling artistic today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Make selfies in the mirror.")))
(assert (end))
)

(defrule show-result-7
(answer (answer-given "Yes") (to-question "Feeling social today?"))
?y <- (question (text "Feeling social today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Make a small exhibition of your photos at a local cafe or your house." "Make a video then post it on youtube.")))
(assert (end))
)

(defrule show-result-8
(answer (answer-given "No") (to-question "Feeling social today?"))
?y <- (question (text "Feeling social today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Work on or make your blog/website." 
			"Self publish and make a photobook or zine of your images. Give copies to your friends/family. Offer an ebook version online for free." 
			"Make a video slideshow of your images.")))
(assert (end))
)

(defrule show-result-9
(or (answer (answer-given "Myself") (to-question "Do I want more confidence in myself or with my photography?"))
(answer (answer-given "Myself") (to-question "Your lack of confidence is holding you back from reaching your dreams. Let's work on it! 
Do I want more confidence in myself or with my photography?")))
(or ?y <- (question (text "Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography"))
?y <- (question (text "Your lack of confidence is holding you back from reaching your dreams. Let's work on it! 
Do I want more confidence in myself or with my photography?") (valid-answers "Myself" "My photography")))
=>
(retract ?y)
(assert (result (text "Make a list of low risk things that scare you. Do one a day.")))
(assert (end))
)

(defrule show-result-10
(answer (answer-given "Yes") (to-question "Do I want to photograph objects?"))
?y <- (question (text "Do I want to photograph objects?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Shoot what's in your camera bag.")))
(assert (end))
)

(defrule show-result-11
(answer (answer-given "No") (to-question "Do I want to photograph objects?"))
?y <- (question (text "Do I want to photograph objects?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Have a photoshoot of your loved ones at home.")))
(assert (end))
)

(defrule show-result-12
(answer (answer-given "Color pallette") (to-question "Choose one topic to do opposite of what you usually do."))
?y <- (question (text "Choose one topic to do opposite of what you usually do.") (valid-answers "Settings" "Color pallette" "Camera"))
=>
(retract ?y)
(assert (result (text "If you shoot during the day, shoot at night." "If you shoot in b/w, shoot in color (and vice versa).")))
(assert (end))
)

(defrule show-result-13
(answer (answer-given "Juxtaposition") (to-question "Choose one topic to shoot:"))
?y <- (question (text "Choose one topic to shoot:") (valid-answers "Juxtaposition" "Graphical elements" "Emotion"))
=>
(retract ?y)
(assert (result (text "Choose one: emotions, physical, colors.")))
(assert (end))
)

(defrule show-result-14
(answer (answer-given "Sharing") (to-question "Is it because sharing my photos scares me or from the lack of 'likes'?"))
?y <- (question (text "Is it because sharing my photos scares me or from the lack of 'likes'?") (valid-answers "Sharing" "Lack of likes"))
=>
(retract ?y)
(assert (result (text "Post photos that YOU love. If you love them, others will too.")))
(assert (end))
)

(defrule show-result-15
(answer (answer-given "Lack of likes") (to-question "Is it because sharing my photos scares me or from the lack of 'likes'?"))
?y <- (question (text "Is it because sharing my photos scares me or from the lack of 'likes'?") (valid-answers "Sharing" "Lack of likes"))
=>
(retract ?y)
(assert (result (text "Delete your Instagram to avoid jealousy/comparing yourself from other photographers.")))
(assert (end))
)

(defrule show-result-16
(answer (answer-given "Yes") (to-question "Do I want to stay within walking distance?"))
?y <- (question (text "Do I want to stay within walking distance?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Stay within 5 blocks of your home to shoot.")))
(assert (end))
)

(defrule show-result-17
(answer (answer-given "No") (to-question "Do I want to stay within walking distance?"))
?y <- (question (text "Do I want to stay within walking distance?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Go to the closest big city to shoot.")))
(assert (end))
)

(defrule show-result-18
(answer (answer-given "Yes") (to-question "Do I want to go overseas?"))
?y <- (question (text "Do I want to go overseas?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Plan an international photography adventure.")))
(assert (end))
)

(defrule show-result-19
(answer (answer-given "No") (to-question "Do I want to go overseas?"))
?y <- (question (text "Do I want to go overseas?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Travel outside of your home state to shoot.")))
(assert (end))
)

(defrule show-result-20
(answer (answer-given "Yes") (to-question "Do I usually shoot from a far distance?"))
?y <- (question (text "Do I usually shoot from a far distance?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Prefocus your lens to .7m (3 feet) and only shoot at that distance for 1 month.")))
(assert (end))
)

(defrule show-result-21
(answer (answer-given "No") (to-question "Do I usually shoot from a far distance?"))
?y <- (question (text "Do I usually shoot from a far distance?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Only shoot macro for the day.")))
(assert (end))
)

(defrule show-result-22
(answer (answer-given "No") (to-question "Am I feeling retro today?"))
?y <- (question (text "Am I feeling retro today?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Only use your phone to shoot.")))
(assert (end))
)

(defrule show-result-23
(answer (answer-given "Shapes") (to-question "Do I want to concentrate on composition or shooting shapes?"))
?y <- (question (text "Do I want to concentrate on composition or shooting shapes?") (valid-answers "Composition" "Shapes"))
=>
(retract ?y)
(assert (result (text "Shoot squares" "Shoot triangles" "Shoot circles")))
(assert (end))
)

(defrule show-result-24
(answer (answer-given "Face") (to-question "Choose between face and body:"))
?y <- (question (text "Choose between face and body:") (valid-answers "Face" "Body"))
=>
(retract ?y)
(assert (result (text "Shoot only facial expressions today.")))
(assert (end))
)

(defrule show-result-25
(answer (answer-given "Body") (to-question "Choose between face and body:"))
?y <- (question (text "Choose between face and body:") (valid-answers "Face" "Body"))
=>
(retract ?y)
(assert (result (text "Shoot only body gestures today.")))
(assert (end))
)

(defrule show-result-26
(answer (answer-given "Yes") (to-question "Do I want to converse with the subjects?"))
?y <- (question (text "Do I want to converse with the subjects?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (question (text "Ask strangers to make their portrait. Keep asking until you get 10 people to say 'yes'.") (valid-answers "Okay")))
)

(defrule show-result-27
(answer (answer-given "No") (to-question "Do I want to converse with the subjects?"))
?y <- (question (text "Do I want to converse with the subjects?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Use a flash. You'll see people don't really care.")))
(assert (end))
)

(defrule show-result-28
(answer (answer-given "Closer") (to-question "Do I want to be closer or further from the subject(s)?"))
?y <- (question (text "Do I want to be closer or further from the subject(s)?") (valid-answers "Closer" "Further"))
=>
(retract ?y)
(assert (result (text "The Video Technique: 
1. Pretend to record a video. 
2. Move closer to the subject. 
3. Take your photo.")))
(assert (end))
)

(defrule show-result-29
(answer (answer-given "Further") (to-question "Do I want to be closer or further from the subject(s)?"))
?y <- (question (text "Do I want to be closer or further from the subject(s)?") (valid-answers "Closer" "Further"))
=>
(retract ?y)
(assert (result (text "The Fishing Technique: 
1. Choose your scene. 
2. Wait for the subject to enter your frame. 
3. Take your photo.")))
(assert (end))
)

(defrule show-result-30
(answer (answer-given "Yes") (to-question "Am I patient?"))
?y <- (question (text "Am I patient?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Use a disposable camera.")))
(assert (end))
)

(defrule show-result-31
(answer (answer-given "No") (to-question "Am I patient?"))
?y <- (question (text "Am I patient?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Use a Fujifilm Instax.")))
(assert (end))
)

(defrule show-result-32
(answer (answer-given "Yes") (to-question "Do I want to shoot traidtional compositions?"))
?y <- (question (text "Do I want to shoot traidtional compositions?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Rule of thirds" "Fibonacci spiral" "Golden rectangle")))
(assert (end))
)

(defrule show-result-33
(answer (answer-given "No") (to-question "Do I want to shoot traidtional compositions?"))
?y <- (question (text "Do I want to shoot traidtional compositions?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Center eye" "High/low angle" "Dutch angle")))
(assert (end))
)

(defrule show-result-34
(answer (answer-given "Yes") (to-question "Ready to take it to the next step?"))
?y <- (question (text "Ready to take it to the next step?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Try to get 10 people to say 'no' to your request of photographing them." 
			"Conquer your fears, meet new peers. Attend an Eric Kim workshop." 
			"See how long you can photograph someone until they walk away.")))
(assert (end))
)

(defrule show-result-35
(answer (answer-given "No") (to-question "Ready to take it to the next step?"))
?y <- (question (text "Ready to take it to the next step?") (valid-answers "Yes" "No"))
=>
(retract ?y)
(assert (result (text "Good job on making it here! Keep working at it until you are ready to progress.")))
(assert (end))
)
