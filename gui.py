import tkinter as tk

class QuestionDialog:
    def __init__(self,parent, question, answers):
        self.buttons = []
        top = self.top = tk.Toplevel(parent)
        top.geometry("400x200")
        top.title("Question Dialog")

        self.label = tk.Label(top, text=question)
        self.label.pack(pady=5)

        for answer in answers:
            btn = tk.Button(top, text=answer, command=self.on_ok)
            btn.pack(pady=5)
            self.buttons.append(btn)

    def on_ok(self):
        self.top.destroy()


def showQuestionDialog(question: str, answers: list):
    dialog = QuestionDialog(root, question, answers)
    root.wait_window(dialog.top)


if __name__ == '__main__':
    root = tk.Tk()
    root.title("Main")
    root.geometry("300x100")
    question = "Whats up?"
    answers = ["Great", "Boring", "50/50"]
    start_button = tk.Button(root, text="Start", command=lambda: showQuestionDialog(question, answers))
    start_button.pack(pady=20)
    root.mainloop()
