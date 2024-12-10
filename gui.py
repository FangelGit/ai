import tkinter as tk
import logic
import clips


env = clips.Environment()
env.load("baza.clp")
env.reset()



class QuestionDialog:
    def __init__(self, parent, question, answers):
        self.buttons = []
        top = self.top = tk.Toplevel(parent)
        top.geometry("400x200")
        top.title("Question Dialog")
        self.chosen_answer = ''
        self.question = question
        self.label = tk.Label(top, text=self.question)
        self.label.pack(pady=5)

        for answer in answers:
            btn = tk.Button(top, text=answer, command=lambda ans=answer: self.on_ok(ans))
            btn.pack(pady=5)
            self.buttons.append(btn)

    def on_ok(self, answer):
        self.chosen_answer = answer
        logic.assert_answer(env, self.chosen_answer, self.question)
        for fact in env.facts():
            print(fact)
        env.run()
        self.top.destroy()
        show_question_dialog()


    def get_answer(self):
        return self.chosen_answer


def show_question_dialog():
    question = logic.get_question(env)
    dialog = QuestionDialog(root, question['text'], question['valid-answers'])
    root.wait_window(dialog.top)


if __name__ == '__main__':
    root = tk.Tk()
    root.title("Main")
    root.geometry("300x100")
    answers = ["Great", "Boring", "50/50"]
    start_button = tk.Button(root, text="Start", command=show_question_dialog)
    start_button.pack(pady=20)
    root.mainloop()
