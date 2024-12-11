import tkinter as tk
from logic import LogicClass


EXCEPTIONS = []
logicClass = LogicClass()

def clear_window(wdw, exceptions=[]):
    window_elements = list(wdw.children.values())
    for ch in window_elements:
        if ch not in exceptions:
            ch.destroy()


def question_click(answer, question):
    logicClass.assert_answer(answer, question)
    for fact in logicClass.ENV.facts():
        print(fact)
    logicClass.ENV.run()
    show_question()


def show_question():
    clear_window(root, EXCEPTIONS)
    question = logicClass.get_question_fact()
    if question:
        q_label.config(text=question['text'])
        curr_buttons = []
        for answer in question['valid-answers']:
            btn = tk.Button(root, text=answer, command=lambda ans=answer: question_click(ans, question['text']))
            btn.pack(pady=5)
            curr_buttons.append(btn)
    else:
        q_label.config(text="")
        res_label = tk.Label(root, text='', wraplength=200)
        res_label.pack(pady=5)
        res_label.config(text='\n\n'.join(logicClass.get_result_fact()['text']))
        restart_btn = tk.Button(root, text="Restart", command=restart_click)
        restart_btn.pack(pady=5)


def restart_click():
    logicClass.restart()
    show_question()


def start_click():
    show_question()


if __name__ == '__main__':
    root = tk.Tk()
    root.title("Photography Adventure")
    root.geometry("300x300")
    q_label = tk.Label(root, text='Do you wanna start?', wraplength=200)
    q_label.pack(pady=5)
    EXCEPTIONS.append(q_label)
    start_button = tk.Button(root, text="Start", command=start_click)
    start_button.pack(pady=20)
    root.mainloop()
