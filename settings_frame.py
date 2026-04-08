import customtkinter as ctk
import tkinter.filedialog as fd
import shutil
import os

class SettingsFrame(ctk.CTkFrame):
    def __init__(self, parent, logic, config):
        super().__init__(parent, fg_color="#0F0C1D", corner_radius=0)
        self.logic = logic
        self.config = config
        self.purple = "#7E22CE"

        # Заголовок
        ctk.CTkLabel(self, text="НАСТРОЙКИ СИСТЕМЫ", font=("Arial", 24, "bold"), text_color=self.purple).pack(pady=20)

        self.scroll = ctk.CTkScrollableFrame(self, fg_color="#1A162B", width=600, height=450)
        self.scroll.pack(expand=True, fill="both", padx=30, pady=10)

        self.create_settings()

    def create_settings(self):
        # 1. ОПЕРАТИВНАЯ ПАМЯТЬ (RAM)
        self.add_label("Выделение оперативной памяти (ГБ):")
        self.ram_slider = ctk.CTkSlider(self.scroll, from_=2, to=16, number_of_steps=14,
                                        button_color=self.purple, progress_color=self.purple, command=self.save_settings)
        self.ram_slider.set(self.config.get("ram", 4))
        self.ram_slider.pack(fill="x", padx=20, pady=5)
        self.ram_label = ctk.CTkLabel(self.scroll, text=f"{int(self.ram_slider.get())} GB")
        self.ram_label.pack()

        # 2. ПУТЬ К JAVA
        self.add_label("Путь к исполняемому файлу Java:")
        java_frame = ctk.CTkFrame(self.scroll, fg_color="transparent")
        java_frame.pack(fill="x", padx=20)
        self.java_path_ent = ctk.CTkEntry(java_frame, placeholder_text="По умолчанию", width=350)
        self.java_path_ent.insert(0, self.config.get("java_path", ""))
        self.java_path_ent.pack(side="left", padx=5)
        ctk.CTkButton(java_frame, text="Обзор", width=80, fg_color=self.purple, command=self.browse_java).pack(side="left")

        # 3. АВТО-ЗАКРЫТИЕ ЛАУНЧЕРА
        self.auto_close = ctk.BooleanVar(value=self.config.get("auto_close", False))
        ctk.CTkCheckBox(self.scroll, text="Закрывать лаунчер после запуска игры", variable=self.auto_close,
                        command=self.save_settings, fg_color=self.purple, hover_color="#581C87").pack(anchor="w", padx=20, pady=15)

        # 4. РАЗРЕШЕНИЕ ЭКРАНА
        self.add_label("Разрешение окна игры:")
        self.res_menu = ctk.CTkOptionMenu(self.scroll, values=["1280x720", "1920x1080", "854x480"],
                                          fg_color=self.purple, button_color=self.purple, command=lambda x: self.save_settings())
        self.res_menu.set(self.config.get("resolution", "1280x720"))
        self.res_menu.pack(anchor="w", padx=20, pady=5)

        # 5. ПОЛНОЭКРАННЫЙ РЕЖИМ
        self.fullscreen = ctk.BooleanVar(value=self.config.get("fullscreen", False))
        ctk.CTkCheckBox(self.scroll, text="Запускать в полноэкранном режиме", variable=self.fullscreen,
                        command=self.save_settings, fg_color=self.purple).pack(anchor="w", padx=20, pady=10)

        # 6. ТЕМА ИНТЕРФЕЙСА
        self.add_label("Тема лаунчера:")
        self.theme_menu = ctk.CTkOptionMenu(self.scroll, values=["Dark", "Light"],
                                            fg_color=self.purple, button_color=self.purple,
                                            command=self.change_theme)
        self.theme_menu.set(self.config.get("theme", "Dark"))
        self.theme_menu.pack(anchor="w", padx=20, pady=5)

        ctk.CTkLabel(self.scroll, text="").pack(pady=10) # Разделитель

        # 7. ОЧИСТКА КЭША
        ctk.CTkButton(self.scroll, text="Очистить временные файлы (кэш)", fg_color="#3B82F6",
                      command=self.clear_cache).pack(fill="x", padx=20, pady=5)

        # 8. СБРОС ВСЕХ НАСТРОЕК
        ctk.CTkButton(self.scroll, text="Сбросить все настройки", fg_color="#EF4444",
                      command=self.reset_all).pack(fill="x", padx=20, pady=5)

    def add_label(self, text):
        ctk.CTkLabel(self.scroll, text=text, font=("Arial", 14, "bold")).pack(anchor="w", padx=20, pady=(15, 5))

    def browse_java(self):
        path = fd.askopenfilename(title="Выберите java.exe или java")
        if path:
            self.java_path_ent.delete(0, "end")
            self.java_path_ent.insert(0, path)
            self.save_settings()

    def change_theme(self, theme):
        ctk.set_appearance_mode(theme)
        self.save_settings()

    def clear_cache(self):
        cache_path = os.path.join(self.logic.base_path, "libraries")
        if os.path.exists(cache_path):
            shutil.rmtree(cache_path)
            os.makedirs(cache_path)
            print("Кэш очищен")

    def reset_all(self):
        self.config.update({"ram": 4, "java_path": "", "auto_close": False, "resolution": "1280x720", "fullscreen": False, "theme": "Dark"})
        self.ram_slider.set(4)
        self.java_path_ent.delete(0, "end")
        self.auto_close.set(False)
        self.res_menu.set("1280x720")
        self.fullscreen.set(False)
        self.theme_menu.set("Dark")
        self.save_settings()

    def save_settings(self, *args):
        self.ram_label.configure(text=f"{int(self.ram_slider.get())} GB")
        self.config["ram"] = int(self.ram_slider.get())
        self.config["java_path"] = self.java_path_ent.get()
        self.config["auto_close"] = self.auto_close.get()
        self.config["resolution"] = self.res_menu.get()
        self.config["fullscreen"] = self.fullscreen.get()
        self.config["theme"] = self.theme_menu.get()
        self.logic.save_config(self.config)