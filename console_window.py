import customtkinter as ctk


class ConsoleWindow(ctk.CTkToplevel):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.title("Violet Launcher - Console")
        self.geometry("850x450")
        self.configure(fg_color="#0F0C1D")

        # Поверх всех окон, чтобы видеть логи сразу
        self.attributes("-topmost", True)

        self.text_area = ctk.CTkTextbox(self, fg_color="#000000", text_color="#00FF00",
                                        font=("Courier New", 12), border_width=1, border_color="#7E22CE")
        self.text_area.pack(fill="both", expand=True, padx=10, pady=10)

    def write(self, message):
        try:
            # Проверяем, существует ли еще текстовое поле
            if self.text_area.winfo_exists():
                self.text_area.insert("end", message)
                self.text_area.see("end")
        except:
            # Если окно закрыто, просто игнорируем попытку записи
            pass