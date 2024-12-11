import clips
from clips.facts import TemplateFact


def assert_template(env, tmpl_name, fields: dict):
    tmpl = env.find_template(tmpl_name)
    return tmpl.assert_fact(**fields)


def assert_question(env, question_text, answers):
    return assert_template(env, 'question', {'text': question_text, 'valid-answers': answers})


def assert_answer(env, answer, question_text):
    return assert_template(env, 'answer', {'answer-given': answer, 'to-question': question_text})


def get_question_fact(env):
    for fact in env.facts():
        if fact.template.name == 'question':
            return fact


def get_result_fact(env):
    for fact in env.facts():
        if fact.template.name == 'result':
            return fact


if __name__ == '__main__':
    environment = clips.Environment()
    environment.load(path="baza.clp")
    environment.reset()

    # execute the activations in the agenda
    environment.run()



