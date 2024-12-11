import tkinter as tk
import logic
import clips


EXCEPTIONS = []

def clear_window(wdw, exceptions=[]):
    window_elements = list(wdw.children.values())
    for ch in window_elements:
        if ch not in exceptions:
            ch.destroy()


def question_click(answer, question):
    logic.assert_answer(ENV, answer, question)
    for fact in ENV.facts():
        print(fact)
    ENV.run()
    show_question()


def show_question():
    clear_window(root, EXCEPTIONS)
    question = logic.get_question_fact(ENV)
    if question:
        q_label.config(text=question['text'])
        curr_buttons = []
        for answer in question['valid-answers']:
            btn = tk.Button(root, text=answer, command=lambda ans=answer: question_click(ans, question['text']))
            btn.pack(pady=5)
            curr_buttons.append(btn)
    else:
        q_label.config(text="")
        res_label.config(text='\n'.join(logic.get_result_fact(ENV)['text']))
        restart_btn = tk.Button(root, text="Restart", command=start_click)
        restart_btn.pack(pady=5)


def start_click():
    global ENV
    ENV = clips.Environment()
    ENV.load("baza.clp")
    ENV.reset()
    ENV.run()
    show_question()


if __name__ == '__main__':
    root = tk.Tk()
    root.title("Main")
    root.geometry("300x300")
    q_label = tk.Label(root, text='Do you wanna start?', wraplength=200)
    q_label.pack(pady=5)
    EXCEPTIONS.append(q_label)
    start_button = tk.Button(root, text="Start", command=start_click)
    start_button.pack(pady=20)
    res_label = tk.Label(root, text='', wraplength=200)
    res_label.pack(pady=5)
    EXCEPTIONS.append(res_label)
    root.mainloop()
