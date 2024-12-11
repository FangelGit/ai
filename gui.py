import tkinter as tk
import tkinter.simpledialog

import logic
import clips


class QuestionDialog:
    def __init__(self, parent, question, answers):
        self.buttons = []
        top = self.top = tk.Toplevel(parent)
        top.geometry("400x200")
        top.title("Question Dialog")
        top.grab_set()
        self.chosen_answer = ''
        self.question = question
        self.label = tk.Label(top, text=self.question)
        self.label.pack(pady=5)


        for answer in answers:
            btn = tk.Button(top, text=answer, command=lambda ans=answer: self.on_ok(ans))
            btn.pack(pady=5)
            self.buttons.append(btn)
        top.wait_window()


    def on_ok(self, answer):
        self.chosen_answer = answer
        logic.assert_answer(ENV, self.chosen_answer, self.question)
        for fact in ENV.facts():
            print(fact)
        ENV.run()
        self.top.destroy()
        show_question_dialog()


def show_question_dialog():
    question = logic.get_question(ENV)
    dialog = QuestionDialog(root, question['text'], question['valid-answers'])
    dialog.grab_set()
    root.wait_window(dialog.top)


def start_click():
    global ENV
    ENV = clips.Environment()
    ENV.load("baza.clp")
    ENV.reset()
    print(root)
    ENV.run()
    show_question_dialog()


if __name__ == '__main__':
    root = tk.Tk()
    root.title("Main")
    root.geometry("300x100")
    answers = ["Great", "Boring", "50/50"]
    start_button = tk.Button(root, text="Start", command=start_click)
    start_button.pack(pady=20)
    root.mainloop()
