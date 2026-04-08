import customtkinter as ctk
from logic import LauncherLogic
from optimization import LauncherOptimizer
from settings_frame import SettingsFrame
from console_window import ConsoleWindow
import threading
import subprocess
import os


class VioletLauncherUI(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.logic = LauncherLogic()
        self.opt = LauncherOptimizer()
        self.config = self.logic.load_config()

        self.title("Violet Launcher")
        self.geometry("1000x650")

        # Применяем тему (Закреплено)
        ctk.set_appearance_mode(self.config.get("theme", "Dark"))

        self.purple = "#7E22CE"
        self.bg_dark = "#0F0C1D"
        self.card_color = "#1A162B"

        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)

        self.create_sidebar()

        # Инициализация всех вкладок (ВСЕ ЗАКРЕПЛЕНО)
        self.main_frame = self.create_main_view()
        self.versions_frame = self.create_versions_view()
        self.mods_frame = self.create_content_view("mod")
        self.resource_frame = self.create_content_view("resourcepack")
        self.shaders_frame = self.create_content_view("shader")
        self.settings_frame = SettingsFrame(self, self.logic, self.config)

        self.show_frame("main")

    def create_sidebar(self):
        self.sidebar = ctk.CTkFrame(self, width=200, fg_color="#161229", corner_radius=0)
        self.sidebar.grid(row=0, column=0, sticky="nsew")
        ctk.CTkLabel(self.sidebar, text="VIOLET", font=("Arial", 28, "bold"), text_color=self.purple).pack(pady=30)

        btns = [
            ("🎮 Играть", "main"),
            ("📂 Версии", "versions"),
            ("📦 Моды", "mods"),
            ("🎨 Текстуры", "resource"),
            ("✨ Шейдеры", "shaders"),
            ("⚙️ Настройки", "settings")
        ]
        for t, f in btns:
            ctk.CTkButton(self.sidebar, text=t, fg_color="transparent", anchor="w", height=45,
                          command=lambda x=f: self.show_frame(x)).pack(fill="x", padx=10, pady=5)

    def create_main_view(self):
        frame = ctk.CTkFrame(self, fg_color=self.bg_dark, corner_radius=0)
        card = ctk.CTkFrame(frame, fg_color=self.card_color, corner_radius=20)
        card.place(relx=0.5, rely=0.4, anchor="center", relwidth=0.6, relheight=0.4)

        self.nick_entry = ctk.CTkEntry(card, width=300, height=40, placeholder_text="Никнейм")
        self.nick_entry.insert(0, self.config.get("username", ""))
        self.nick_entry.pack(pady=20)

        self.profile_select = ctk.CTkOptionMenu(card, values=self.get_profile_names(), fg_color=self.purple,
                                                button_color=self.purple)
        if self.config.get("selected_profile"):
            self.profile_select.set(self.config["selected_profile"])
        self.profile_select.pack(pady=10)

        self.launch_btn = ctk.CTkButton(frame, text="ИГРАТЬ", height=70, width=350, fg_color=self.purple,
                                        font=("Arial", 20, "bold"), command=self.start_launch_process)
        self.launch_btn.place(relx=0.5, rely=0.8, anchor="center")
        return frame

    def create_versions_view(self):
        frame = ctk.CTkFrame(self, fg_color=self.bg_dark, corner_radius=0)
        box = ctk.CTkFrame(frame, fg_color=self.card_color)
        box.pack(padx=20, pady=10, fill="x")
        self.new_ver = ctk.CTkOptionMenu(box, values=self.logic.get_allowed_versions())  # Список версий закреплен
        self.new_ver.pack(side="left", padx=10, pady=15)
        self.new_loader = ctk.CTkOptionMenu(box, values=["Vanilla", "Fabric", "Forge"])
        self.new_loader.pack(side="left", padx=10)
        ctk.CTkButton(box, text="Создать сборку", command=self.add_profile, fg_color=self.purple).pack(side="right",
                                                                                                       padx=10)
        self.prof_list = ctk.CTkScrollableFrame(frame, fg_color=self.card_color)
        self.prof_list.pack(fill="both", expand=True, padx=20, pady=10)
        self.refresh_profile_list()
        return frame

    def create_content_view(self, p_type):
        frame = ctk.CTkFrame(self, fg_color=self.bg_dark, corner_radius=0)
        top = ctk.CTkFrame(frame, fg_color=self.card_color)
        top.pack(fill="x", padx=20, pady=10)

        prof_menu = ctk.CTkOptionMenu(top, values=self.get_profile_names(), fg_color=self.purple,
                                      button_color=self.purple)
        prof_menu.pack(side="left", padx=10, pady=10)

        search_ent = ctk.CTkEntry(top, placeholder_text=f"Поиск {p_type}...", width=250)
        search_ent.pack(side="left", padx=10)

        res_scroll = ctk.CTkScrollableFrame(frame, fg_color=self.card_color)
        res_scroll.pack(fill="both", expand=True, padx=20, pady=10)

        def run_search():
            query = search_ent.get()
            p_name = prof_menu.get()
            for w in res_scroll.winfo_children(): w.destroy()
            if p_name == "Нет сборок" or not query: return

            def search_thread():
                try:
                    prof = next(p for p in self.config['profiles'] if p['name'] == p_name)
                    hits = self.logic.search_modrinth(query, prof['ver'], prof['loader'], p_type)
                    for h in hits:
                        if res_scroll.winfo_exists():
                            self.after(0, lambda item=h, p=prof: self.render_content_item(res_scroll, item, p, p_type))
                except:
                    pass

            threading.Thread(target=search_thread, daemon=True).start()

        ctk.CTkButton(top, text="Найти", width=80, command=run_search, fg_color=self.purple).pack(side="left", padx=5)
        return frame

    def render_content_item(self, master, item, prof, p_type):
        if not master.winfo_exists(): return
        row = ctk.CTkFrame(master, fg_color="#241E3B")
        row.pack(fill="x", pady=2, padx=5)
        ctk.CTkLabel(row, text=item.get('title', 'Unknown')[:35], font=("Arial", 12, "bold")).pack(side="left", padx=10)
        ctk.CTkButton(row, text="Скачать", width=80, fg_color=self.purple,
                      command=lambda pid=item['project_id']: self.download_action(pid, prof['ver'], prof['name'],
                                                                                  p_type)).pack(side="right", padx=10,
                                                                                                pady=5)

    def download_action(self, pid, ver, pname, ptype):
        threading.Thread(target=lambda: self.logic.download_content(pid, ver, pname, ptype), daemon=True).start()

    # --- ЛОГИКА ЗАПУСКА С ЛЮТОЙ ОПТИМИЗАЦИЕЙ ---

    def start_launch_process(self):
        p_name = self.profile_select.get()
        if p_name == "Нет сборок": return
        self.save_current_ui_state()
        self.launch_btn.configure(state="disabled", text="ЗАПУСК...")
        console = ConsoleWindow(self)  # Консоль закреплена
        threading.Thread(target=self.actual_launch_thread, args=(p_name, console), daemon=True).start()

    def actual_launch_thread(self, p_name, console):
        try:
            prof = next(p for p in self.config['profiles'] if p['name'] == p_name)
            f_id = self.logic.install_loader(prof['ver'], prof['loader'])

            # --- РЕАЛЬНО РАБОЧАЯ СИСТЕМА ОЗУ ---
            user_ram = self.config.get("ram", 4)
            self.opt.ram_mb = user_ram * 1024

            # Получаем лютые аргументы для FPS
            jvm_args = self.opt.get_jvm_arguments()

            cmd = self.logic.generate_launch_command(
                f_id,
                self.config.get("username", "Player"),
                jvm_args,
                p_name
            )

            # Кастомная Java из закрепленных настроек
            java_custom = self.config.get("java_path")
            if java_custom and os.path.exists(java_custom):
                cmd[0] = java_custom

            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, bufsize=1)

            # Авто-закрытие (Закреплено)
            if self.config.get("auto_close"):
                self.after(5000, self.destroy)

            while True:
                line = process.stdout.readline()
                if not line: break
                if console.winfo_exists():
                    self.after(0, lambda l=line: console.write(l))
                else:
                    break
            process.wait()
        except Exception as e:
            if console.winfo_exists():
                self.after(0, lambda: console.write(f"ERROR: {e}"))
        finally:
            if self.launch_btn.winfo_exists():
                self.after(0, lambda: self.launch_btn.configure(state="normal", text="ИГРАТЬ"))

    def show_frame(self, name):
        self.save_current_ui_state()
        frames = {
            "main": self.main_frame, "versions": self.versions_frame,
            "mods": self.mods_frame, "resource": self.resource_frame,
            "shaders": self.shaders_frame, "settings": self.settings_frame
        }
        for f in frames.values(): f.grid_forget()
        frames[name].grid(row=0, column=1, sticky="nsew")

    def save_current_ui_state(self):
        self.config["username"] = self.nick_entry.get()
        self.config["selected_profile"] = self.profile_select.get()
        self.logic.save_config(self.config)

    def get_profile_names(self):
        return [p['name'] for p in self.config['profiles']] if self.config['profiles'] else ["Нет сборок"]

    def refresh_profile_list(self):
        for w in self.prof_list.winfo_children(): w.destroy()
        for p in self.config['profiles']:
            r = ctk.CTkFrame(self.prof_list, fg_color="#241E3B");
            r.pack(fill="x", pady=2, padx=5)
            ctk.CTkLabel(r, text=p['name']).pack(side="left", padx=15)
            ctk.CTkButton(r, text="X", width=30, fg_color="#450A0A",
                          command=lambda n=p['name']: self.del_profile(n)).pack(side="right", padx=10)

    def add_profile(self):
        n = f"{self.new_loader.get()} - {self.new_ver.get()}"
        if n not in [p['name'] for p in self.config['profiles']]:
            self.config['profiles'].append({"name": n, "ver": self.new_ver.get(), "loader": self.new_loader.get()})
            self.logic.save_config(self.config)
            self.refresh_profile_list()
            self.profile_select.configure(values=self.get_profile_names())

    def del_profile(self, n):
        self.config['profiles'] = [p for p in self.config['profiles'] if p['name'] != n]
        self.logic.save_config(self.config)
        self.refresh_profile_list()
        self.profile_select.configure(values=self.get_profile_names())


if __name__ == "__main__":
    app = VioletLauncherUI()
    app.mainloop()