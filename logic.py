import clips
from clips.facts import TemplateFact

class LogicClass:
    ENV = clips.Environment()

    def assert_template(self, tmpl_name, fields: dict):
        tmpl = self.ENV.find_template(tmpl_name)
        return tmpl.assert_fact(**fields)


    def assert_question(self, question_text, answers):
        return self.assert_template('question', {'text': question_text, 'valid-answers': answers})


    def assert_answer(self, answer, question_text):
        return self.assert_template('answer', {'answer-given': answer, 'to-question': question_text})


    def get_question_fact(self):
        for fact in self.ENV.facts():
            if fact.template.name == 'question':
                return fact


    def get_result_fact(self):
        for fact in self.ENV.facts():
            if fact.template.name == 'result':
                return fact
            
    def restart(self):
        self.ENV.reset()
        # execute the activations in the agenda
        self.ENV.run()

    def __init__(self):
        self.ENV.load(path="baza.clp")
        self.restart()

