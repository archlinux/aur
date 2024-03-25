#!/usr/bin/env python3

import os
import re
import shutil
import signal
import subprocess

import gi

gi.require_version('Gtk', '3.0')
gi.require_version('Gdk', '3.0')

from gi.repository import Gtk, Gdk


class Main(Gtk.Window):
    def __init__(self):
        # Initialize the main window with title and default size
        Gtk.Window.__init__(self, title="Faugus Launcher")
        self.set_default_size(580, 580)

        self.game_running = None

        # Define the configuration path
        config_path = os.path.expanduser("~/.config/faugus-launcher/")
        # Create the configuration directory if it doesn't exist
        if not os.path.exists(config_path):
            os.makedirs(config_path)
        self.working_directory = config_path
        os.chdir(self.working_directory)

        self.games = []

        # Create main box and its components
        box_main = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        box_top = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        box_left = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        box_right = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        box_right.set_border_width(10)
        box_bottom = Gtk.Box()

        # Create buttons for adding, editing, and deleting games
        self.button_add = Gtk.Button()
        self.button_add.connect("clicked", self.on_button_add_clicked)
        self.button_add.set_image(Gtk.Image.new_from_icon_name("list-add-symbolic", Gtk.IconSize.BUTTON))
        self.button_add.set_size_request(50, 50)
        self.button_add.set_margin_top(10)
        self.button_add.set_margin_start(10)
        self.button_add.set_margin_end(10)

        self.button_edit = Gtk.Button()
        self.button_edit.connect("clicked", self.on_button_edit_clicked)
        self.button_edit.set_image(Gtk.Image.new_from_icon_name("document-edit-symbolic", Gtk.IconSize.BUTTON))
        self.button_edit.set_size_request(50, 50)
        self.button_edit.set_margin_top(10)
        self.button_edit.set_margin_start(10)
        self.button_edit.set_margin_end(10)

        self.button_delete = Gtk.Button()
        self.button_delete.connect("clicked", self.on_button_delete_clicked)
        self.button_delete.set_image(Gtk.Image.new_from_icon_name("edit-delete-symbolic", Gtk.IconSize.BUTTON))
        self.button_delete.set_size_request(50, 50)
        self.button_delete.set_margin_top(10)
        self.button_delete.set_margin_start(10)
        self.button_delete.set_margin_end(10)

        # Create checkbox for 'Close after launch' option
        self.checkbox_close_after_launch = Gtk.CheckButton(label="Close after launch")
        self.checkbox_close_after_launch.set_margin_top(10)
        self.checkbox_close_after_launch.set_margin_end(10)
        self.checkbox_close_after_launch.set_margin_bottom(10)
        self.checkbox_close_after_launch.set_active(False)
        self.checkbox_close_after_launch.set_active(self.load_config())
        self.checkbox_close_after_launch.connect("toggled", self.on_checkbox_toggled)

        # Create button for killing processes
        button_kill = Gtk.Button()
        button_kill.connect("clicked", self.on_button_kill_clicked)
        button_kill.set_size_request(50, 50)
        button_kill.set_image(Gtk.Image.new_from_icon_name("window-close-symbolic", Gtk.IconSize.BUTTON))
        button_kill.set_margin_top(10)
        button_kill.set_margin_end(10)
        button_kill.set_margin_bottom(10)

        # Create button for launching games
        self.button_play = Gtk.Button()
        self.button_play.connect("clicked", self.on_button_play_clicked)
        self.button_play.set_size_request(150, 50)
        self.button_play.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))
        self.button_play.set_border_width(10)

        # Create scrolled window for game list
        scroll_box = Gtk.ScrolledWindow()
        scroll_box.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        scroll_box.set_margin_top(10)
        scroll_box.set_margin_end(10)

        self.last_clicked_row = None
        self.last_click_time = 0

        # Create list box for displaying games
        self.game_list = Gtk.ListBox(halign=Gtk.Align.START, valign=Gtk.Align.START)
        self.game_list.connect("button-release-event", self.on_button_release_event)
        scroll_box.add(self.game_list)
        self.load_games()

        # Pack buttons and other components into the bottom box
        box_bottom.pack_start(self.button_play, False, False, 0)
        box_bottom.pack_end(button_kill, False, False, 0)
        box_bottom.pack_end(self.checkbox_close_after_launch, False, False, 0)

        # Pack buttons into the left box
        box_left.pack_start(self.button_add, False, False, 0)
        box_left.pack_start(self.button_edit, False, False, 0)
        box_left.pack_start(self.button_delete, False, False, 0)

        # Pack left and scrolled box into the top box
        box_top.pack_start(box_left, False, True, 0)
        box_top.pack_start(scroll_box, True, True, 0)

        # Pack top and bottom boxes into the main box
        box_main.pack_start(box_top, True, True, 0)
        box_main.pack_end(box_bottom, False, True, 0)
        self.add(box_main)

        # Set signal handler for child process termination
        signal.signal(signal.SIGCHLD, self.on_child_process_closed)

    def on_button_play_clicked(self, widget):
        # Handle play button click event
        listbox_row = self.game_list.get_selected_row()
        if listbox_row:
            # Get the selected game's title
            hbox = listbox_row.get_child()
            game_label = hbox.get_children()[0]
            title = game_label.get_text()
            # Find the selected game object
            game = next((j for j in self.games if j.title == title), None)
            if game and self.game_running is None:
                # Format the title for command execution
                title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', game.title)
                title_formatted = title_formatted.replace(' ', '-')
                title_formatted = '-'.join(title_formatted.lower().split())

                # Extract game launch information
                launch_arguments = game.launch_arguments
                path = game.path
                prefix = game.prefix
                game_arguments = game.game_arguments
                runner_path = game.runner_path
                mangohud = game.mangohud

                # Determine if gamemode is enabled
                gamemode = ""
                gamemode_enabled = os.path.exists("/usr/bin/gamemoderun")
                if gamemode_enabled:
                    gamemode = game.gamemode

                # Construct the command for game launch
                command = (f'{mangohud} '
                           f'WINEPREFIX={prefix} '
                           f'GAMEID={title_formatted} '
                           f'PROTONPATH=\'{os.path.expanduser(runner_path)}\' '
                           f'{launch_arguments} '
                           f'{gamemode} '
                           f'"/usr/bin/umu-run" "{path}" "{game_arguments}"')

                print(command)

                # Launch the game with subprocess
                if self.checkbox_close_after_launch.get_active():
                    subprocess.Popen(["/bin/bash", "-c", command], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                    import sys
                    sys.exit()
                else:
                    self.game_running = subprocess.Popen(["/bin/bash", "-c", command])
                    self.button_play.set_image(
                        Gtk.Image.new_from_icon_name("media-playback-stop-symbolic", Gtk.IconSize.BUTTON))

                self.button_play.set_sensitive(False)

    def on_button_kill_clicked(self, widget):
        # Handle kill button click event
        if self.game_running is not None:
            subprocess.run("ls -l /proc/*/exe 2>/dev/null | grep -E 'wine(64)?-preloader|wineserver' | perl "
                           "-pe 's;^.*/proc/(\d+)/exe.*$;$1;g;' | xargs -n 1 kill | killall -s9 winedevice.exe tee",
                           shell=True)
            self.game_running.wait()
            self.game_running = None
        else:
            subprocess.run("ls -l /proc/*/exe 2>/dev/null | grep -E 'wine(64)?-preloader|wineserver' | perl "
                           "-pe 's;^.*/proc/(\d+)/exe.*$;$1;g;' | xargs -n 1 kill | killall -s9 winedevice.exe tee",
                           shell=True)
        self.button_play.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))

    def on_button_add_clicked(self, widget):
        # Handle add button click event
        add_game_dialog = AddGame(self)
        add_game_dialog.connect("response", self.on_dialog_response, add_game_dialog)

        add_game_dialog.combobox_runner.set_active(0)
        add_game_dialog.show()

    def on_button_edit_clicked(self, widget):
        # Handle edit button click event
        listbox_row = self.game_list.get_selected_row()
        if listbox_row:
            hbox = listbox_row.get_child()
            game_label = hbox.get_children()[0]
            title = game_label.get_text()
            game = next((j for j in self.games if j.title == title), None)
            if game:
                edit_game_dialog = AddGame(self)
                edit_game_dialog.connect("response", self.on_edit_dialog_response, edit_game_dialog, game)
                edit_game_dialog.entry_title.set_text(game.title)
                edit_game_dialog.entry_path.set_text(game.path)
                edit_game_dialog.entry_prefix.set_text(game.prefix)
                edit_game_dialog.entry_launch_arguments.set_text(game.launch_arguments)
                edit_game_dialog.entry_game_arguments.set_text(game.game_arguments)
                runner_preload = game.runner
                model = edit_game_dialog.combobox_runner.get_model()
                for i, row in enumerate(model):
                    if row[0] == runner_preload:
                        edit_game_dialog.combobox_runner.set_active(i)
                        break

                mangohud_status = False
                gamemode_status = False
                with open("games.txt", "r") as file:
                    for line in file:
                        fields = line.strip().split(";")
                        if len(fields) >= 9 and fields[0] == game.title:
                            mangohud_status = fields[7] == "MANGOHUD=1"
                            gamemode_status = fields[8] == "gamemoderun"

                edit_game_dialog.checkbox_mangohud.set_active(mangohud_status)
                edit_game_dialog.checkbox_gamemode.set_active(gamemode_status)
                edit_game_dialog.check_existing_shortcut()

                edit_game_dialog.show()

    def on_button_delete_clicked(self, widget):
        # Handle delete button click event
        listbox_row = self.game_list.get_selected_row()
        if listbox_row:
            # Retrieve the selected game's title
            hbox = listbox_row.get_child()
            game_label = hbox.get_children()[0]
            title = game_label.get_text()
            # Find the selected game object
            game = next((j for j in self.games if j.title == title), None)
            if game:
                # Display confirmation dialog
                confirmation_dialog = ConfirmationDialog()
                response = confirmation_dialog.run()

                if response == Gtk.ResponseType.YES:
                    # Remove game and associated files if required
                    if confirmation_dialog.get_remove_prefix_state():
                        game_prefix = game.prefix
                        prefix_path = os.path.expanduser(game_prefix)
                        try:
                            shutil.rmtree(prefix_path)
                        except FileNotFoundError:
                            pass

                    # Remove the shortcut
                    self.remove_shortcut(game)

                    self.games.remove(game)
                    self.save_games()
                    self.update_list()

                confirmation_dialog.destroy()

    def on_dialog_response(self, dialog, response_id, add_game_dialog):
        # Handle dialog response
        if response_id == Gtk.ResponseType.OK:
            # Check if fields are validated
            if not add_game_dialog.validate_fields():
                # If fields are not validated, return and keep the dialog open
                return True
            else:
                # Proceed with adding the game
                # Get game information from dialog fields
                title = add_game_dialog.entry_title.get_text()
                path = add_game_dialog.entry_path.get_text()
                launch_arguments = add_game_dialog.entry_launch_arguments.get_text()
                game_arguments = add_game_dialog.entry_game_arguments.get_text()
                runner = add_game_dialog.combobox_runner.get_active_text()
                runner_path = self.get_runner_path(runner)
                prefix = add_game_dialog.entry_prefix.get_text()

                # Concatenate game information
                game_info = (f"{title};{path};{prefix};{launch_arguments};{game_arguments};"
                             f"{runner};{runner_path}")

                # Determine mangohud and gamemode status
                mangohud = "MANGOHUD=1" if add_game_dialog.checkbox_mangohud.get_active() else ""
                gamemode = "gamemoderun" if add_game_dialog.checkbox_gamemode.get_active() else ""

                game_info += f";{mangohud};{gamemode}\n"

                # Write game info to file
                with open("games.txt", "a") as file:
                    file.write(game_info)

                # Create Game object and update UI
                game = Game(title, path, prefix, launch_arguments, game_arguments, runner, runner_path, mangohud,
                            gamemode)
                self.games.append(game)
                self.add_item_list(game)
                self.update_list()

                # Determine the state of the shortcut checkbox
                shortcut_state = add_game_dialog.checkbox_shortcut.get_active()

                # Call add_remove_shortcut method
                self.add_shortcut(game, shortcut_state)
        else:
            add_game_dialog.destroy()

        # Ensure the dialog is destroyed when canceled
        add_game_dialog.destroy()

    def on_edit_dialog_response(self, dialog, response_id, edit_game_dialog, game):
        # Handle edit dialog response
        if response_id == Gtk.ResponseType.OK:
            # Check if fields are validated
            if not edit_game_dialog.validate_fields():
                # If fields are not validated, return and keep the dialog open
                return True
            else:
                # Update game object with new information
                game.title = edit_game_dialog.entry_title.get_text()
                game.path = edit_game_dialog.entry_path.get_text()
                game.prefix = edit_game_dialog.entry_prefix.get_text()
                game.launch_arguments = edit_game_dialog.entry_launch_arguments.get_text()
                game.game_arguments = edit_game_dialog.entry_game_arguments.get_text()
                game.runner = edit_game_dialog.combobox_runner.get_active_text()
                game.runner_path = self.get_runner_path(game.runner)
                game.mangohud = edit_game_dialog.checkbox_mangohud.get_active()
                game.gamemode = edit_game_dialog.checkbox_gamemode.get_active()

                # Save changes and update UI
                self.save_games()
                self.update_list()

                # Determine the state of the shortcut checkbox
                shortcut_state = edit_game_dialog.checkbox_shortcut.get_active()

                # Call add_remove_shortcut method
                self.add_shortcut(game, shortcut_state)

        edit_game_dialog.destroy()

    def add_shortcut(self, game, shortcut_state):
        # Check if the shortcut checkbox is checked
        if not shortcut_state:
            # Remove existing shortcut if it exists
            self.remove_shortcut(game)
            return

        # Handle the click event of the Create Shortcut button
        title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', game.title)
        title_formatted = title_formatted.replace(' ', '-')
        title_formatted = '-'.join(title_formatted.lower().split())

        prefix = game.prefix
        path = game.path
        launch_arguments = game.launch_arguments
        game_arguments = game.game_arguments
        runner_path = self.get_runner_path(game.runner)

        mangohud = ""
        if game.mangohud:
            mangohud = "MANGOHUD=1"

        gamemode = ""
        if game.gamemode:
            gamemode = "gamemoderun"

        # Check if the icon directory exists and create if it doesn't
        icon_directory = os.path.expanduser("~/.config/faugus-launcher/icons/")
        if not os.path.exists(icon_directory):
            os.makedirs(icon_directory)

        # Execute wrestool command to extract icon
        os.system(f'wrestool -x -t14 "{path}" > ~/.config/faugus-launcher/icons/{title_formatted}.ico')

        command = (f'{mangohud} '
                   f'WINEPREFIX={prefix} '
                   f'GAMEID={title_formatted} '
                   f'PROTONPATH=\"{runner_path}\" '
                   f'{launch_arguments} '
                   f'{gamemode} '
                   f'"/usr/bin/umu-run" "{path}" "{game_arguments}"')

        # Create a .desktop file
        desktop_file_content = f"""[Desktop Entry]
Name={game.title}
Exec=sh -c '{command}'
Icon={os.path.expanduser("~/.config/faugus-launcher/icons/")}{title_formatted}.ico
Type=Application
Categories=Game;
Path={os.path.expanduser("~/.config/faugus-launcher/")}
"""

        # Check if the destination directory exists and create if it doesn't
        desktop_directory = os.path.expanduser("~/.local/share/applications/")
        if not os.path.exists(desktop_directory):
            os.makedirs(desktop_directory)

        desktop_file_path = os.path.expanduser(f"~/.local/share/applications/{title_formatted}.desktop")

        with open(desktop_file_path, 'w') as desktop_file:
            desktop_file.write(desktop_file_content)

        # Make the .desktop file executable
        os.chmod(desktop_file_path, 0o755)

        # Copy the shortcut to Desktop
        desktop_shortcut_path = os.path.expanduser(f"~/Desktop/{title_formatted}.desktop")
        shutil.copy(desktop_file_path, desktop_shortcut_path)

    def remove_shortcut(self, game):
        # Remove existing shortcut if it exists
        title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', game.title)
        title_formatted = title_formatted.replace(' ', '-')
        title_formatted = '-'.join(title_formatted.lower().split())

        desktop_file_path = os.path.expanduser(f"~/.local/share/applications/{title_formatted}.desktop")

        if os.path.exists(desktop_file_path):
            os.remove(desktop_file_path)

        # Remove shortcut from Desktop if exists
        desktop_shortcut_path = os.path.expanduser(f"~/Desktop/{title_formatted}.desktop")
        if os.path.exists(desktop_shortcut_path):
            os.remove(desktop_shortcut_path)

        # Remove icon file
        icon_file_path = os.path.expanduser(f"~/.config/faugus-launcher/icons/{title_formatted}.ico")
        if os.path.exists(icon_file_path):
            os.remove(icon_file_path)

    def create_desktop_entry(self, game, shortcut_state):
        # Create the .desktop file in ~/.local/share/applications/
        title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', game.title)
        title_formatted = title_formatted.replace(' ', '-')
        title_formatted = '-'.join(title_formatted.lower().split())

        prefix = game.prefix
        path = game.path
        launch_arguments = game.launch_arguments
        game_arguments = game.game_arguments

        mangohud = ""
        if game.mangohud:
            mangohud = "MANGOHUD=1"

        gamemode = ""
        if game.gamemode:
            gamemode = "gamemoderun"

        command = (f'{mangohud} '
                   f'WINEPREFIX={prefix} '
                   f'GAMEID={title_formatted} '
                   f'PROTONPATH=\"{os.path.expanduser("~/.steam/steam/steamapps/common/Proton - Experimental")}\" '
                   f'{launch_arguments} '
                   f'{gamemode} '
                   f'"/usr/bin/umu-run" "{path}" "{game_arguments}"')

        desktop_file_content = f"""[Desktop Entry]
                                Name={game.title}
                                Exec=sh -c '{command}'
                                Icon=application-x-executable
                                Type=Application
                                Categories=Game;
                                """

        desktop_directory = os.path.expanduser("~/.local/share/applications/")
        if not os.path.exists(desktop_directory):
            os.makedirs(desktop_directory)

        desktop_file_path = os.path.expanduser(f"~/.local/share/applications/{game.title}.desktop")

        with open(desktop_file_path, 'w') as desktop_file:
            desktop_file.write(desktop_file_content)

        os.chmod(desktop_file_path, 0o755)

    def remove_desktop_entry(self, game):
        # Remove the .desktop file from ~/.local/share/applications/
        desktop_file_path = os.path.expanduser(f"~/.local/share/applications/{game.title}.desktop")

        if os.path.exists(desktop_file_path):
            os.remove(desktop_file_path)

    def remove_shortcut_from_desktop(self, game):
        # Remove the shortcut from the desktop if it exists
        desktop_link_path = os.path.expanduser(f"~/Desktop/{game.title}.desktop")

        if os.path.exists(desktop_link_path):
            os.remove(desktop_link_path)

    def add_item_list(self, game):
        # Add a game item to the list
        hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        hbox.set_border_width(10)
        hbox.set_size_request(500, -1)

        game_label = Gtk.Label.new(game.title)
        hbox.pack_start(game_label, True, True, 0)

        listbox_row = Gtk.ListBoxRow()
        listbox_row.add(hbox)
        listbox_row.set_activatable(False)
        listbox_row.set_can_focus(False)
        listbox_row.set_selectable(True)
        self.game_list.add(listbox_row)

        hbox.set_halign(Gtk.Align.CENTER)
        listbox_row.set_valign(Gtk.Align.START)

        self.button_edit.set_sensitive(False)
        self.button_delete.set_sensitive(False)
        self.button_play.set_sensitive(False)

    def update_list(self):
        # Update the game list
        for row in self.game_list.get_children():
            self.game_list.remove(row)

        self.games.clear()
        self.load_games()
        self.show_all()

    def on_child_process_closed(self, signum, frame):
        # Handle child process closing
        if self.game_running and self.game_running.poll() is not None:
            self.game_running = None
        self.button_play.set_sensitive(True)
        self.button_play.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))

    def load_games(self):
        # Load games from file
        try:
            with open("games.txt", "r") as file:
                for line in file:
                    data = line.strip().split(";")
                    if len(data) >= 7:
                        title, path, prefix, launch_arguments, game_arguments, runner, runner_path = data[:7]
                        if len(data) >= 9:
                            mangohud = data[7]
                            gamemode = data[8]
                        else:
                            mangohud = ""
                            gamemode = ""
                        game = Game(title, path, prefix, launch_arguments, game_arguments, runner, runner_path,
                                    mangohud, gamemode)
                        self.games.append(game)
                self.games = sorted(self.games, key=lambda x: x.title.lower())
                self.game_list.foreach(Gtk.Widget.destroy)
                for game in self.games:
                    self.add_item_list(game)
        except FileNotFoundError:
            pass

    def save_games(self):
        # Save game information to file
        with open("games.txt", "w") as file:
            for game in self.games:
                # Determine mangohud and gamemode values
                mangohud_value = "MANGOHUD=1" if game.mangohud else ""
                gamemode_value = "gamemoderun" if game.gamemode else ""
                # Construct line with game information
                line = (f"{game.title};{game.path};{game.prefix};{game.launch_arguments};{game.game_arguments};"
                        f"{game.runner};{game.runner_path};{mangohud_value};{gamemode_value}\n")
                file.write(line)

    def show_warning_message(self, message):
        # Show a warning message dialog
        dialog = Gtk.MessageDialog(transient_for=self, flags=0, message_type=Gtk.MessageType.WARNING,
                                   buttons=Gtk.ButtonsType.OK, text=message, )
        dialog.run()
        dialog.destroy()

    def on_checkbox_toggled(self, widget):
        # Handle checkbox toggling event
        checkbox_state = widget.get_active()
        self.save_config(checkbox_state)

    def load_config(self):
        # Load configuration from file
        config_file = os.path.join(self.working_directory, 'config.ini')
        if os.path.exists(config_file):
            with open(config_file, 'r') as f:
                return f.read().strip() == 'close-onlaunch=true'
        else:
            # Save default configuration if file does not exist
            self.save_config(False)
            return False

    def save_config(self, checkbox_state):
        # Save configuration to file
        value = 'close-onlaunch=true' if checkbox_state else 'close-onlaunch=false'
        config_file = os.path.join(self.working_directory, 'config.ini')
        with open(config_file, 'w') as f:
            f.write(value)

    def on_button_release_event(self, listbox, event):
        # Handle button release event
        if event.type == Gdk.EventType.BUTTON_RELEASE and event.button == Gdk.BUTTON_PRIMARY:
            current_row = listbox.get_row_at_y(event.y)
            current_time = event.time
            if current_row == self.last_clicked_row and current_time - self.last_click_time < 500:
                # Double-click detected, trigger play button click event
                widget = self.button_play
                self.on_button_play_clicked(widget)
            else:
                # Single-click, update last click details and enable buttons
                self.last_clicked_row = current_row
                self.last_click_time = current_time

                self.button_edit.set_sensitive(True)
                self.button_delete.set_sensitive(True)
                self.button_play.set_sensitive(True)

    def get_runner_path(self, runner):
        # Get the path for the selected runner
        if runner == "Proton Experimental":
            return "~/.steam/steam/steamapps/common/Proton - Experimental"
        else:
            return os.path.expanduser(f"~/.steam/steam/compatibilitytools.d/{runner}")


class Game:
    def __init__(self, title, path, prefix, launch_arguments, game_arguments, runner, runner_path, mangohud, gamemode):
        # Initialize a Game object with various attributes
        self.title = title  # Title of the game
        self.path = path  # Path to the game executable
        self.launch_arguments = launch_arguments  # Arguments to launch the game
        self.game_arguments = game_arguments  # Arguments specific to the game
        self.runner = runner  # Selected game runner
        self.runner_path = runner_path  # Path to the game runner
        self.mangohud = mangohud  # Boolean indicating whether Mangohud is enabled
        self.gamemode = gamemode  # Boolean indicating whether Gamemode is enabled
        self.prefix = prefix  # Prefix for Wine games


class ConfirmationDialog(Gtk.Dialog):
    def __init__(self):
        # Initialize the ConfirmationDialog
        Gtk.Dialog.__init__(self, title="Remove Game")

        # Configure dialog properties
        self.set_decorated(False)
        self.set_resizable(False)
        self.set_default_size(300, 100)

        # Create a grid layout for the dialog
        grid = Gtk.Grid()
        grid.set_column_homogeneous(True)
        grid.set_row_homogeneous(True)
        grid.set_row_spacing(10)
        grid.set_column_spacing(10)
        grid.set_border_width(10)

        # Add grid to dialog's content area
        self.get_content_area().add(grid)

        # Create a label
        label = Gtk.Label()
        label.set_label("Are you sure?")
        label.set_halign(Gtk.Align.CENTER)
        grid.attach(label, 0, 0, 2, 1)

        # Create "No" button
        button_no = Gtk.Button(image=Gtk.Image.new_from_icon_name("gtk-cancel", Gtk.IconSize.BUTTON))
        button_no.connect("clicked", lambda x: self.response(Gtk.ResponseType.NO))
        grid.attach(button_no, 0, 1, 1, 1)

        # Create "Yes" button
        button_yes = Gtk.Button(image=Gtk.Image.new_from_icon_name("gtk-ok", Gtk.IconSize.BUTTON))
        button_yes.connect("clicked", lambda x: self.response(Gtk.ResponseType.YES))
        grid.attach(button_yes, 1, 1, 1, 1)

        # Create a checkbox to optionally remove the prefix
        self.checkbox = Gtk.CheckButton(label="Also remove the prefix")
        self.checkbox.set_halign(Gtk.Align.CENTER)
        grid.attach(self.checkbox, 0, 2, 2, 1)

        # Display all widgets
        self.show_all()

    def get_remove_prefix_state(self):
        # Get the state of the checkbox
        return self.checkbox.get_active()


class AddGame(Gtk.Dialog):
    def __init__(self, parent):
        # Initialize the AddGame dialog
        super().__init__(title="Add/Edit Game", parent=parent)
        self.set_default_size(640, 480)
        self.set_resizable(False)
        self.set_modal(True)

        # Create the content area
        self.box = self.get_content_area()
        grid = Gtk.Grid()
        grid.set_row_spacing(10)
        grid.set_column_spacing(10)
        grid.set_margin_start(10)
        grid.set_margin_end(10)
        grid.set_margin_top(10)
        grid.set_margin_bottom(10)

        # Widgets for title
        self.label_title = Gtk.Label(label="Title:")
        self.entry_title = Gtk.Entry()

        # Widgets for path
        self.label_path = Gtk.Label(label="Path:")
        self.entry_path = Gtk.Entry()
        self.button_search = Gtk.Button()
        self.button_search.set_image(Gtk.Image.new_from_icon_name("system-search-symbolic", Gtk.IconSize.BUTTON))
        self.button_search.connect("clicked", self.on_button_search_clicked)

        # Widgets for prefix
        self.label_prefix = Gtk.Label(label="Prefix:")
        self.entry_prefix = Gtk.Entry()

        # Widgets for launch arguments
        self.label_launch_arguments = Gtk.Label(label="Launch Arguments:")
        self.entry_launch_arguments = Gtk.Entry()

        # Widgets for game arguments
        self.label_game_arguments = Gtk.Label(label="Game's Arguments:")
        self.entry_game_arguments = Gtk.Entry()

        # Widgets for runner
        self.label_runner = Gtk.Label(label="Runner:")
        self.combobox_runner = Gtk.ComboBoxText()
        self.combobox_runner.connect("changed", self.on_combobox_changed)
        self.populate_combobox()

        # Checkboxes for optional features
        self.checkbox_mangohud = Gtk.CheckButton(label="MangoHud")
        self.checkbox_gamemode = Gtk.CheckButton(label="Feral Game Mode")

        # Button for Winetricks
        self.button_winetricks = Gtk.Button(label="Winetricks")
        self.button_winetricks.connect("clicked", self.on_button_winetricks_clicked)

        # Event handlers
        self.entry_title.connect("changed", self.update_prefix_entry)

        # Attach widgets to the grid layout
        grid.attach(self.label_title, 0, 0, 1, 1)
        grid.attach(self.entry_title, 1, 0, 3, 1)

        grid.attach(self.label_path, 0, 1, 1, 1)
        grid.attach(self.entry_path, 1, 1, 2, 1)
        self.entry_path.set_hexpand(True)
        grid.attach(self.button_search, 3, 1, 1, 1)

        grid.attach(self.label_prefix, 0, 2, 1, 1)
        grid.attach(self.entry_prefix, 1, 2, 3, 1)

        grid.attach(self.label_launch_arguments, 0, 3, 1, 1)
        grid.attach(self.entry_launch_arguments, 1, 3, 3, 1)

        grid.attach(self.label_game_arguments, 0, 4, 1, 1)
        grid.attach(self.entry_game_arguments, 1, 4, 3, 1)

        grid.attach(self.label_runner, 0, 5, 1, 1)
        grid.attach(self.combobox_runner, 1, 5, 3, 1)

        grid.attach(self.checkbox_mangohud, 0, 6, 1, 1)
        grid.attach(self.checkbox_gamemode, 1, 6, 1, 1)
        grid.attach(self.button_winetricks, 2, 6, 2, 1)

        # Button for creating shortcut
        self.checkbox_shortcut = Gtk.CheckButton(label="Create Shortcut")
        # self.checkbox_shortcut.connect("clicked", self.on_button_create_shortcut_clicked)

        # Attach the button to the grid layout
        grid.attach(self.checkbox_shortcut, 3, 7, 1, 1)

        self.box.add(grid)

        # Add action buttons
        button_cancel = Gtk.Button()
        button_cancel.add(Gtk.Image.new_from_icon_name("gtk-cancel", Gtk.IconSize.BUTTON))
        self.add_action_widget(button_cancel, Gtk.ResponseType.CANCEL)

        button_ok = Gtk.Button()
        button_ok.add(Gtk.Image.new_from_icon_name("gtk-ok", Gtk.IconSize.BUTTON))
        self.add_action_widget(button_ok, Gtk.ResponseType.OK)

        # Check if optional features are available and enable/disable accordingly
        mangohud_enabled = os.path.exists("/usr/bin/mangohud")
        if not mangohud_enabled:
            self.checkbox_mangohud.set_sensitive(False)
            self.checkbox_mangohud.set_active(False)

        self.gamemode_enabled = os.path.exists("/usr/bin/gamemoderun")
        if not self.gamemode_enabled:
            self.checkbox_gamemode.set_sensitive(False)
            self.checkbox_gamemode.set_active(False)

        winetricks_enabled = os.path.exists("/usr/bin/winetricks")
        if not winetricks_enabled:
            self.button_winetricks.set_sensitive(False)

        # self.create_remove_shortcut(self)
        self.show_all()

    def check_existing_shortcut(self):
        # Check if the shortcut already exists and mark or unmark the checkbox
        title = self.entry_title.get_text().strip()
        if not title:
            return  # If there's no title, there's no shortcut to check

        title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', title).replace(' ', '-').lower()
        desktop_file_path = os.path.expanduser(f"~/.local/share/applications/{title_formatted}.desktop")

        # Check if the shortcut file exists
        shortcut_exists = os.path.exists(desktop_file_path)

        # Mark the checkbox if the shortcut exists
        self.checkbox_shortcut.set_active(shortcut_exists)

    def update_prefix_entry(self, widget):
        # Update the prefix entry based on the title
        title_formatted = re.sub(r'[^a-zA-Z0-9\s]', '', self.entry_title.get_text())
        title_formatted = title_formatted.replace(' ', '-')
        title_formatted = '-'.join(title_formatted.lower().split())
        prefix = os.path.expanduser("~/.config/faugus-launcher/prefixes/") + title_formatted
        self.entry_prefix.set_text(prefix)

    def load_checkboxes_state(self, mangohud, gamemode):
        # Set the state of the MangoHud and Feral Game Mode checkboxes
        self.checkbox_mangohud.set_active(mangohud)
        self.checkbox_gamemode.set_active(gamemode)

    def on_button_winetricks_clicked(self, widget):
        # Handle the click event of the Winetricks button
        validation_result = self.validate_fields()
        if not validation_result:
            # If fields are not validated, show a warning message and return
            self.show_warning_message("Title and Path need to be filled")
            return

        prefix = self.entry_prefix.get_text()

        # Run Wine with the 'win10' argument
        wine_command = (f'WINEPREFIX={prefix} '
                        f'{os.path.expanduser("/usr/bin/wine")} -v win10')
        subprocess.Popen(["/bin/bash", "-c", wine_command])

        # Open Winetricks for the specified Wine prefix
        winetricks_command = (f'WINEPREFIX={prefix} '
                              f'{os.path.expanduser("/usr/bin/winetricks")} ')
        subprocess.Popen(["/bin/bash", "-c", winetricks_command])

    def populate_combobox(self):
        # Populate the runner selection combobox with available options
        if os.path.exists(os.path.expanduser("~/.steam/steam/steamapps/common/Proton - Experimental")):
            self.combobox_runner.append_text("Proton Experimental")

        compatibility_tools_dir = os.path.expanduser("~/.steam/steam/compatibilitytools.d/")
        if os.path.exists(compatibility_tools_dir):
            for item in os.listdir(compatibility_tools_dir):
                item_path = os.path.join(compatibility_tools_dir, item)
                if os.path.isdir(item_path) and item not in ["ULWGL-Launcher", "umu-launcher"]:
                    self.combobox_runner.append_text(item)

    def on_combobox_changed(self, widget):
        # Handle the change event of the runner selection combobox
        pass

    def on_button_search_clicked(self, widget):
        # Handle the click event of the search button to select the game's .exe
        dialog = Gtk.FileChooserDialog(title="Select the game's .exe", parent=self, action=Gtk.FileChooserAction.OPEN)
        dialog.set_current_folder("$HOME/")
        dialog.add_buttons(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OPEN, Gtk.ResponseType.OK)

        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            self.entry_path.set_text(dialog.get_filename())

        dialog.destroy()

    def validate_fields(self):
        # Validate the input fields for title and path
        title = self.entry_title.get_text()
        path = self.entry_path.get_text()

        if not title or not path:
            # Show a warning message if title or path is empty
            self.show_warning_message("Title and Path need to be filled")
            return False

        return True

    def show_warning_message(self, message):
        # Display a warning message dialog
        dialog = Gtk.MessageDialog(transient_for=self, flags=0, message_type=Gtk.MessageType.WARNING,
                                   buttons=Gtk.ButtonsType.OK, text=message)
        dialog.run()
        dialog.destroy()


if __name__ == "__main__":
    app = Main()
    app.connect("destroy", Gtk.main_quit)
    app.show_all()
    Gtk.main()
