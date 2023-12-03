import sys
import subprocess
import json
import os
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QHBoxLayout, QVBoxLayout, QWidget, QAction, QFileDialog, QInputDialog, QMenu, QStyle
from PyQt5.QtCore import Qt, QMimeData

class ScriptRunnerGUI(QMainWindow):
    def __init__(self):
        super().__init__()
        self.script_buttons = {}
        self.terminal_emulators = self.find_terminal_emulators()
        self.selected_terminal = self.terminal_emulators[0] if self.terminal_emulators else None
        self.initUI()

    def initUI(self):
        self.setWindowTitle("Dynamic Script Runner")
        self.setGeometry(300, 300, 400, 400)
        self.setAcceptDrops(True)

        self.mainLayout = QVBoxLayout()
        self.container = QWidget()
        self.container.setLayout(self.mainLayout)
        self.setCentralWidget(self.container)

        # Menu for actions
        self.menu_bar = self.menuBar()
        file_menu = self.menu_bar.addMenu('File')

        add_script_action = QAction('Add Script', self)
        add_script_action.setShortcut('Ctrl+N')
        add_script_action.triggered.connect(self.add_script)
        file_menu.addAction(add_script_action)

        # Terminal emulator selection
        terminal_menu = QMenu('Select Terminal', self)
        for term in self.terminal_emulators:
            term_action = QAction(term, self, checkable=True)
            term_action.triggered.connect(lambda checked, t=term: self.set_terminal_emulator(t))
            if term == self.selected_terminal:
                term_action.setChecked(True)
            terminal_menu.addAction(term_action)
        file_menu.addMenu(terminal_menu)

        self.load_scripts()

    def dragEnterEvent(self, event):
        if event.mimeData().hasUrls():
            event.acceptProposedAction()

    def dropEvent(self, event):
        for url in event.mimeData().urls():
            if url.isLocalFile() and url.toLocalFile().endswith('.sh'):
                self.add_script_from_path(url.toLocalFile())

    def add_script_from_path(self, script_path):
        script_name, ok = QInputDialog.getText(self, 'Script Name', 'Enter name for the script button:', text=os.path.basename(script_path))
        if ok and script_name:
            self.create_script_button(script_name, script_path)
            self.save_script(script_name, script_path)

    def add_script(self):
        file_dialog = QFileDialog(self)
        file_dialog.setNameFilter("Shell scripts (*.sh)")
        script_path, _ = file_dialog.getOpenFileName(self, "Select Script", "", "Shell scripts (*.sh)")
        if script_path:
            self.add_script_from_path(script_path)

    def create_script_button(self, name, path):
        scriptLayout = QHBoxLayout()

        # Script execution button
        btn = QPushButton(name, self)
        btn.clicked.connect(lambda: self.run_script(path))
        scriptLayout.addWidget(btn)

        # Edit button
        edit_icon = self.style().standardIcon(QStyle.SP_FileDialogDetailedView)
        edit_btn = QPushButton(edit_icon, '', self)
        edit_btn.setFixedSize(30, 30)
        edit_btn.clicked.connect(lambda: self.edit_script(path))
        scriptLayout.addWidget(edit_btn)

        # Delete button
        delete_icon = self.style().standardIcon(QStyle.SP_TrashIcon)
        delete_btn = QPushButton(delete_icon, '', self)
        delete_btn.setFixedSize(30, 30)
        delete_btn.clicked.connect(lambda: self.delete_script(name, scriptLayout))
        scriptLayout.addWidget(delete_btn)

        self.mainLayout.addLayout(scriptLayout)
        self.script_buttons[name] = (scriptLayout, path)

    def delete_script(self, name, layout):
    # Assuming the script's layout contains three widgets: run button, edit button, and delete button
        while layout.count():
            item = layout.takeAt(0)
            widget = item.widget()
            if widget is not None:
                widget.deleteLater()

    # Remove layout from main layout and delete
        self.mainLayout.removeItem(layout)
        layout.deleteLater()

    # Remove the script from the dictionary
        if name in self.script_buttons:
            del self.script_buttons[name]
            self.save_all_scripts()


    def edit_script(self, script_path):
        terminal_command = self.get_terminal_command()
        if terminal_command:
            subprocess.Popen(terminal_command + ['vim', script_path])
        else:
            print("Default terminal emulator not found.")

    def run_script(self, script_path):
        terminal_command = self.get_terminal_command()
        if terminal_command:
            subprocess.Popen(terminal_command + ['sh', '-c', f'"{script_path}"; read -p "Press enter to exit..."'])
        else:
            print("Default terminal emulator not found.")

    def find_terminal_emulators(self):
        terminals = ['x-terminal-emulator', 'gnome-terminal', 'konsole', 'xterm', 'kitty']
        return [t for t in terminals if os.path.exists('/usr/bin/' + t)]

    def set_terminal_emulator(self, terminal):
        self.selected_terminal = terminal

    def get_terminal_command(self):
        if self.selected_terminal:
            return ['/usr/bin/' + self.selected_terminal, '-e']
        return None

    def save_script(self, name, path):
        with open('scripts.json', 'r+') as file:
            scripts = json.load(file)
            scripts[name] = path
            file.seek(0)
            json.dump(scripts, file)

    def save_all_scripts(self):
        scripts = {name: data[1] for name, data in self.script_buttons.items()}
        with open('scripts.json', 'w') as file:
            json.dump(scripts, file)

    def load_scripts(self):
        try:
            with open('scripts.json', 'r') as file:
                scripts = json.load(file)
                for name, path in scripts.items():
                    self.create_script_button(name, path)
        except FileNotFoundError:
            with open('scripts.json', 'w') as file:
                json.dump({}, file)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = ScriptRunnerGUI()
    ex.show()
    sys.exit(app.exec_())
