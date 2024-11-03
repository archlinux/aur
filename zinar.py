#!/usr/bin/env python3

import os
os.environ["KIVY_NO_CONSOLELOG"] = "1"
os.environ["KIVY_NO_FILELOG"] = "1"
import subprocess
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.scrollview import ScrollView
from kivy.uix.gridlayout import GridLayout
from kivy.uix.image import Image
from kivy.core.window import Window
from kivy.properties import BooleanProperty
from kivy.graphics import Color, Line


class HoverBehavior:
    """Custom behavior to add hover functionality."""
    hovering = BooleanProperty(False)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        Window.bind(mouse_pos=self.on_mouse_pos)
        
    def on_mouse_pos(self, *args):
        if not self.get_root_window():
            return
        pos = args[1]
        is_hovering = self.collide_point(*self.to_widget(*pos))
        if self.hovering != is_hovering:
            self.hovering = is_hovering
            if self.hovering:
                self.on_hover_enter()
            else:
                self.on_hover_leave()

    def on_hover_enter(self):
        Window.set_system_cursor("hand")

    def on_hover_leave(self):
        Window.set_system_cursor("arrow")


class HoverableLabel(Label, HoverBehavior):
    def __init__(self, exec_cmd, **kwargs):
        super().__init__(**kwargs)
        self.exec_cmd = exec_cmd
        self.bind(hovering=self.on_hover)
        self.bind(on_touch_down=self.on_click)

        with self.canvas.before:
            Color(0, 78/255, 76/255, 1) 
            self.border_line = Line(rounded_rectangle=(self.x, self.y, self.width, self.height, 8), width=1.2)
        self.bind(pos=self.update_line, size=self.update_line)

    def update_line(self, *args):
        """Update border position and size."""
        self.border_line.rounded_rectangle = (self.x, self.y, self.width, self.height, 8)

    def on_hover(self, instance, value):
        """Adjust border color when hovered."""
        with self.canvas.before:
            Color(0, 78/255, 76/255, 0.8 if value else 1)

    def on_click(self, instance, touch):
        """Click to execute program."""
        if self.collide_point(*touch.pos):
            try:
                subprocess.Popen([self.exec_cmd])
            except Exception as e:
                print(f"Failed to start program: {e}")


class MainApp(App):
    def build(self):
        Window.size = (Window.width * 1.3, Window.height * 0.7)
        Window.clearcolor = (0, 0, 0, 0.5)

        main_layout = BoxLayout(orientation='vertical', padding=10, spacing=10)

        title_label = Label(text="Installed GUI Applications", font_size=24, size_hint=(1, 0.1), halign="left")
        title_label.bind(size=title_label.setter('text_size'))
        main_layout.add_widget(title_label)

        scroll_view = ScrollView(size_hint=(1, 0.9))
        programs_layout = GridLayout(cols=2, size_hint_y=None, padding=5, spacing=5, row_default_height=40)
        programs_layout.bind(minimum_height=programs_layout.setter('height'))

        programs = self.get_gui_programs()
        for icon_path, program_name, exec_cmd in programs:
            if icon_path and os.path.isfile(icon_path):
                program_layout = BoxLayout(orientation='horizontal', spacing=10, size_hint_y=None, height=40)
                icon = Image(source=icon_path, size_hint=(None, None), size=(30, 30))
                
                name_label = HoverableLabel(exec_cmd, text=program_name, font_size=16, halign="left", valign="middle")
                name_label.bind(size=name_label.setter('text_size'))
                
                program_layout.add_widget(icon)
                program_layout.add_widget(name_label)
                programs_layout.add_widget(program_layout)
                
                exec_label = Label(text=exec_cmd, font_size=16, halign="left", valign="middle")
                exec_label.bind(size=exec_label.setter('text_size'))
                programs_layout.add_widget(exec_label)

        scroll_view.add_widget(programs_layout)
        main_layout.add_widget(scroll_view)

        return main_layout

    def find_icon_path(self, icon_name):
        icon_dirs = [
            "/usr/share/icons/hicolor/48x48/apps",
            "/usr/share/icons/hicolor/32x32/apps",
            "/usr/share/pixmaps"
        ]
        
        if not icon_name:
            return None
        
        for directory in icon_dirs:
            for ext in ['png', 'svg']:
                icon_path = f"{directory}/{icon_name}.{ext}"
                if os.path.isfile(icon_path):
                    return icon_path
        return None

    def get_gui_programs(self):
        """List installed GUI applications with icons, name, and command based on .desktop entries."""
        apps_path = "/usr/share/applications"
        gui_programs = []

        try:
            for filename in os.listdir(apps_path):
                if filename.endswith(".desktop"):
                    file_path = os.path.join(apps_path, filename)
                    program_name = exec_cmd = icon_name = None

                    with open(file_path, 'r') as file:
                        for line in file:
                            if line.startswith("Name="):
                                program_name = line.split("=")[1].strip()
                            elif line.startswith("Exec="):
                                exec_cmd = line.split("=")[1].strip().split()[0]
                            elif line.startswith("Icon="):
                                icon_name = line.split("=")[1].strip()
                            if program_name and exec_cmd:
                                break

                    icon_path = self.find_icon_path(icon_name) if icon_name else None
                    
                    if program_name and exec_cmd and icon_path:
                        gui_programs.append((icon_path, program_name, exec_cmd))

            return sorted(gui_programs, key=lambda x: x[1] or "")

        except Exception as e:
            return [("Error retrieving applications", f"{e}", "")]

if __name__ == '__main__':
    MainApp().run()

