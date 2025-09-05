#!/usr/bin/env python3
import os
import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
gi.require_version('Gdk', '4.0')
import subprocess
import shutil
from pathlib import Path
from gi.repository import Gtk, Gio, Gdk, GdkPixbuf, GObject, Adw, Pango

import threading
from gi.repository import GLib
import json
import random
import argparse

# To customize the thumbnail size
THUMB_WIDTH = 320
THUMB_HEIGHT = 200
MAX_CHILDREN_PER_LINE = 5
LABEL_MAX_CHARS = 30

class WallpaperManager(Adw.Application):
    import threading
    from gi.repository import GLib
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.daemon_mode = False  # Flag to indicate if we're running in daemon mode
        self.wallpaper_dir = str(Path.home() / "Pictures" / "Wallpapers")
        self.hypr_config_dir = str(Path.home() / ".config" / "hypr")
        self.hyprpaper_conf = os.path.join(self.hypr_config_dir, "hyprpaper.conf")
        self.hyprlock_conf = os.path.join(self.hypr_config_dir, "hyprlock.conf")
        self.current_wallpaper = None
        self.thumbnails = {}
        
        # Cycling feature variables
        self.is_cycling = False
        self.cycle_timeout_id = None
        self.wallpaper_list = []
        self.current_index = 0
        self.cycle_interval = 1800  # Default 30 minutes in seconds
        self.is_random_order = False

        # Multi-monitor support
        self.monitors = self.get_monitors()
        self.monitor_wallpapers = {m: None for m in self.monitors}
        self.is_paused = False
        self.time_of_day_wallpapers = {
            'morning': None,
            'afternoon': None,
            'evening': None,
            'night': None
        }
        self.cycle_countdown = 0
        
        # Use a dedicated config directory inside the user's home folder
        self.config_dir = str(Path.home() / ".config" / "pyprwall")
        self.config_file = os.path.join(self.config_dir, '.pyprwall_config')
        self.cycle_config_file = os.path.join(self.config_dir, '.pyprwall_cycle_config')
        self.wallpaper_cache_file = os.path.join(self.config_dir, '.wallpaper_cache')
        self.wallpaper_cache_meta_file = os.path.join(self.config_dir, '.wallpaper_cache_meta')
        self.thumbnail_cache_dir = os.path.join(self.config_dir, 'thumbnails')
        os.makedirs(self.thumbnail_cache_dir, exist_ok=True)
        
        # Create directories if they don't exist
        os.makedirs(self.wallpaper_dir, exist_ok=True)
        os.makedirs(self.hypr_config_dir, exist_ok=True)
        os.makedirs(self.config_dir, exist_ok=True)

        # Cycle state file
        self.cycle_state_file = os.path.join(self.config_dir, '.pyprwall_cycle_state')
        
        # Load cycle configuration
        self.load_cycle_config()

        # Restore cycling state
        self.restore_cycle_state()

    def load_cycle_config(self):
        """Load cycling configuration from file"""
        try:
            if os.path.exists(self.cycle_config_file):
                with open(self.cycle_config_file, 'r') as f:
                    config = json.load(f)
                    self.cycle_interval = config.get('interval', 1800)
                    self.is_random_order = config.get('random_order', False)
        except Exception as e:
            print(f"Error loading cycle config: {e}")

    def save_cycle_config(self):
        """Save cycling configuration to file"""
        try:
            config = {
                'interval': self.cycle_interval,
                'random_order': self.is_random_order
            }
            with open(self.cycle_config_file, 'w') as f:
                json.dump(config, f)
        except Exception as e:
            print(f"Error saving cycle config: {e}")

    def create_systemd_service(self):
        """Create a systemd user service file for automatic wallpaper cycling"""
        script_path = os.path.abspath(__file__)
        service_content = f"""[Unit]
Description=PyprWall Wallpaper Cycling
After=graphical-session.target

[Service]
Type=simple
ExecStart={script_path} --cycle-daemon
Environment=DISPLAY=:0
Environment=XAUTHORITY=%h/.Xauthority
Restart=on-failure

[Install]
WantedBy=default.target
"""
        
        service_path = os.path.expanduser("~/.config/systemd/user/pyprwall.service")
        os.makedirs(os.path.dirname(service_path), exist_ok=True)
        
        with open(service_path, 'w') as f:
            f.write(service_content)
        
        return service_path

    def enable_systemd_service(self):
        """Enable and start the systemd service"""
        try:
            subprocess.run(["systemctl", "--user", "enable", "pyprwall.service"], check=True)
            subprocess.run(["systemctl", "--user", "start", "pyprwall.service"], check=True)
            return True
        except subprocess.CalledProcessError as e:
            print(f"Error enabling systemd service: {e}")
            return False

    def disable_systemd_service(self):
        """Stop and disable the systemd service"""
        try:
            subprocess.run(["systemctl", "--user", "stop", "pyprwall.service"], check=True)
            subprocess.run(["systemctl", "--user", "disable", "pyprwall.service"], check=True)
            return True
        except subprocess.CalledProcessError as e:
            print(f"Error disabling systemd service: {e}")
            return False

    def run_daemon(self):
        """Run the application in daemon mode for wallpaper cycling"""
        self.daemon_mode = True
        
        # Load the last used folder
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    folder = f.read().strip()
                    if os.path.exists(folder):
                        self.wallpaper_dir = folder
            except Exception as e:
                print(f"Error reading config file: {e}")
        
        # Load wallpapers
        supported_formats = ['.png', '.jpg', '.jpeg', '.jxl', '.webp']
        try:
            wallpapers = [os.path.join(self.wallpaper_dir, f) for f in os.listdir(self.wallpaper_dir)
                         if os.path.isfile(os.path.join(self.wallpaper_dir, f)) and
                         os.path.splitext(f)[1].lower() in supported_formats]
            wallpapers.sort()
            self.wallpaper_list = wallpapers
        except Exception as e:
            print(f"Error loading wallpapers: {e}")
            return
        
        if not self.wallpaper_list:
            print("No wallpapers found in the directory")
            return
        
        # Load cycle configuration
        self.load_cycle_config()
        
        # Start cycling
        print(f"Starting wallpaper cycling with {len(self.wallpaper_list)} wallpapers")
        self.start_cycling()
        
        # Run the main loop
        from gi.repository import GLib
        loop = GLib.MainLoop()
        try:
            loop.run()
        except KeyboardInterrupt:
            print("Stopping wallpaper cycling")
            self.stop_cycling()

    def do_activate(self):
        """
        Activates the application, creating the main window and its UI elements.
        """
        # Create main window with larger default size
        self.win = Gtk.ApplicationWindow(application=self)
        self.win.set_default_size(1200, 900)  # Increased height for new controls
        self.win.set_title("PyprWall - Hyprland Wallpaper Manager")

        # Create header bar
        header_bar = Gtk.HeaderBar()
        self.win.set_titlebar(header_bar)

        # Open button
        self.open_button = Gtk.Button(label="Open Folder")
        self.open_button.connect("clicked", self.on_open_clicked)
        header_bar.pack_start(self.open_button)

        # Preview button
        self.preview_button = Gtk.Button(label="Preview")
        self.preview_button.connect("clicked", self.on_preview_clicked)
        self.preview_button.set_sensitive(False)
        header_bar.pack_start(self.preview_button)

        # Apply button
        self.apply_button = Gtk.Button(label="Apply to Desktop & Lockscreen")
        self.apply_button.connect("clicked", self.on_apply_clicked)
        self.apply_button.set_sensitive(False)
        header_bar.pack_end(self.apply_button)

        # Create main box
        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.win.set_child(main_box)

        # Create cycling controls
        self.create_cycling_controls(main_box)

        # Scrolled window for grid
        scrolled = Gtk.ScrolledWindow()
        scrolled.set_vexpand(True)  # Make it expand vertically
        main_box.append(scrolled)

        # Create flow box for thumbnails
        self.flow_box = Gtk.FlowBox()
        self.flow_box.set_max_children_per_line(MAX_CHILDREN_PER_LINE)
        self.flow_box.set_selection_mode(Gtk.SelectionMode.SINGLE)
        self.flow_box.connect("selected-children-changed", self.on_wallpaper_selected)

        # Increased spacing between thumbnails
        try:
            self.flow_box.set_row_spacing(20)
            self.flow_box.set_column_spacing(20)
        except Exception:
            # older bindings may not have these setters; ignore if not present
            pass

        scrolled.set_child(self.flow_box)

        # Create a container for the status label and spinner
        status_container = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        status_container.set_halign(Gtk.Align.CENTER)
        status_container.set_margin_bottom(10)

        # Status label
        self.status_label = Gtk.Label(label="Select a wallpaper folder to begin")
        status_container.append(self.status_label)

        # Loading spinner
        self.spinner = Gtk.Spinner()
        self.spinner.set_halign(Gtk.Align.CENTER)
        status_container.append(self.spinner)

        main_box.append(status_container)

        self.win.present()
        # Call initialization directly (GTK4: realize/map may not fire reliably)
        self.on_window_realize(self.win)

    def get_monitors(self):
        """Detect available monitors using hyprctl."""
        try:
            result = subprocess.run(['hyprctl', 'monitors', '-j'], capture_output=True, text=True, timeout=5)
            monitors = []
            if result.returncode == 0:
                data = json.loads(result.stdout)
                for mon in data:
                    monitors.append(mon.get('name', ''))
            return monitors if monitors else ['default']
        except Exception as e:
            print(f"Error detecting monitors: {e}")
            return ['default']

    def get_time_of_day(self):
        import datetime
        hour = datetime.datetime.now().hour
        if 6 <= hour < 12:
            return 'morning'
        elif 12 <= hour < 17:
            return 'afternoon'
        elif 17 <= hour < 21:
            return 'evening'
        else:
            return 'night'

    def show_notification(self, message):
        try:
            subprocess.run(['notify-send', 'PyprWall', message], check=False)
        except Exception as e:
            print(f"Notification error: {e}")

    def update_cycle_ui(self):
        # Show next wallpaper and countdown
        if not self.is_cycling or self.is_paused:
            self.cycle_status_label.set_label("Cycling paused")
        else:
            next_idx = (self.current_index + 1) % len(self.cycling_wallpapers)
            next_wallpaper = os.path.basename(self.cycling_wallpapers[next_idx]) if self.cycling_wallpapers else "-"
            self.cycle_status_label.set_label(f"Next: {next_wallpaper} in {self.cycle_countdown}s")

    def pause_cycling(self):
        self.is_paused = True
        self.save_cycle_state()
        self.update_cycle_ui()

    def resume_cycling(self):
        self.is_paused = False
        self.save_cycle_state()
        self.update_cycle_ui()

    def create_cycling_controls(self, parent_box):
        """Create the cycling controls UI"""
        # Create a frame for cycling controls
        cycling_frame = Gtk.Frame()
        cycling_frame.set_label("Automatic Wallpaper Cycling")
        cycling_frame.set_margin_top(10)
        cycling_frame.set_margin_bottom(10)
        cycling_frame.set_margin_start(10)
        cycling_frame.set_margin_end(10)
        
        # Create main cycling box
        cycling_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        cycling_box.set_margin_top(10)
        cycling_box.set_margin_bottom(10)
        cycling_box.set_margin_start(10)
        cycling_box.set_margin_end(10)
        
        # First row: interval controls
        interval_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        interval_box.set_halign(Gtk.Align.CENTER)
        
        interval_label = Gtk.Label(label="Change wallpaper every:")
        interval_box.append(interval_label)
        
        # Spin button for interval (in minutes)
        self.interval_spin = Gtk.SpinButton()
        self.interval_spin.set_range(1, 120)  # 1 minute to 2 hours
        self.interval_spin.set_increments(1, 5)
        self.interval_spin.set_value(self.cycle_interval // 60)  # Convert seconds to minutes
        self.interval_spin.connect("value-changed", self.on_interval_changed)
        interval_box.append(self.interval_spin)
        
        minutes_label = Gtk.Label(label="minutes")
        interval_box.append(minutes_label)
        
        cycling_box.append(interval_box)
        
        # Second row: options
        options_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=20)
        options_box.set_halign(Gtk.Align.CENTER)
        
        # Random order checkbox
        self.random_check = Gtk.CheckButton(label="Random order")
        self.random_check.set_active(self.is_random_order)
        self.random_check.connect("toggled", self.on_random_toggled)
        options_box.append(self.random_check)
        
        cycling_box.append(options_box)
        
        # Third row: control buttons
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        button_box.set_halign(Gtk.Align.CENTER)
        
        # Start/Stop cycling button
        self.cycle_button = Gtk.Button(label="Start Cycling")
        self.cycle_button.connect("clicked", self.on_cycle_button_clicked)
        self.cycle_button.set_sensitive(False)  # Will be enabled when wallpapers are loaded
        button_box.append(self.cycle_button)
        
        # Next wallpaper button (for manual control during cycling)
        self.next_button = Gtk.Button(label="Next Wallpaper")
        self.next_button.connect("clicked", self.on_next_wallpaper_clicked)
        self.next_button.set_sensitive(False)
        button_box.append(self.next_button)

        # Pause/Resume cycling button
        self.pause_button = Gtk.Button(label="Pause Cycling")
        self.pause_button.connect("clicked", self.on_pause_button_clicked)
        self.pause_button.set_sensitive(False)
        button_box.append(self.pause_button)
        
        cycling_box.append(button_box)
        
        # Systemd service controls
        systemd_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        systemd_box.set_halign(Gtk.Align.CENTER)
        
        self.systemd_button = Gtk.Button(label="Enable Auto-Start")
        self.systemd_button.connect("clicked", self.on_systemd_button_clicked)
        systemd_box.append(self.systemd_button)
        
        cycling_box.append(systemd_box)
        
        # Status for cycling
        self.cycle_status_label = Gtk.Label(label="")
        self.cycle_status_label.set_margin_top(5)
        cycling_box.append(self.cycle_status_label)
        
        cycling_frame.set_child(cycling_box)
        parent_box.append(cycling_frame)

    def on_interval_changed(self, spin_button):
        """Handle interval spin button changes"""
        self.cycle_interval = int(spin_button.get_value()) * 60  # Convert minutes to seconds
        self.save_cycle_config()
        
        # If currently cycling, restart with new interval
        if self.is_cycling:
            self.stop_cycling()
            self.start_cycling()

    def on_random_toggled(self, check_button):
        """Handle random order checkbox toggle"""
        self.is_random_order = check_button.get_active()
        self.save_cycle_config()

    def on_cycle_button_clicked(self, button):
        """Handle start/stop cycling button"""
        if self.is_cycling:
            self.stop_cycling()
        else:
            self.start_cycling()

    def on_next_wallpaper_clicked(self, button):
        """Handle next wallpaper button"""
        if self.wallpaper_list:
            self.cycle_to_next_wallpaper()

    def on_pause_button_clicked(self, button):
        if self.is_paused:
            self.resume_cycling()
            button.set_label("Pause Cycling")
        else:
            self.pause_cycling()
            button.set_label("Resume Cycling")

    def on_systemd_button_clicked(self, button):
        """Handle systemd service enable/disable button"""
        service_path = os.path.expanduser("~/.config/systemd/user/pyprwall.service")
        service_enabled = os.path.exists(service_path)
        
        if service_enabled:
            if self.disable_systemd_service():
                button.set_label("Enable Auto-Start")
                self.cycle_status_label.set_label("Auto-start disabled")
        else:
            self.create_systemd_service()
            if self.enable_systemd_service():
                button.set_label("Disable Auto-Start")
                self.cycle_status_label.set_label("Auto-start enabled")

    def save_cycle_state(self):
        state = {
            'is_cycling': self.is_cycling,
            'is_paused': self.is_paused,
            'current_index': self.current_index,
            'wallpaper_list': self.wallpaper_list,
            'current_wallpaper': self.current_wallpaper
        }
        try:
            with open(self.cycle_state_file, 'w') as f:
                json.dump(state, f)
        except Exception as e:
            print(f"Error saving cycle state: {e}")

    def restore_cycle_state(self):
        if not os.path.exists(self.cycle_state_file):
            return
        try:
            with open(self.cycle_state_file, 'r') as f:
                state = json.load(f)
            self.is_cycling = state.get('is_cycling', False)
            self.is_paused = state.get('is_paused', False)
            self.current_index = state.get('current_index', 0)
            self.wallpaper_list = state.get('wallpaper_list', [])
            self.current_wallpaper = state.get('current_wallpaper', None)
        except Exception as e:
            print(f"Error restoring cycle state: {e}")

    def start_cycling(self):
        """Start the wallpaper cycling"""
        if not self.wallpaper_list:
            if not self.daemon_mode:
                self.cycle_status_label.set_label("No wallpapers available for cycling")
            else:
                print("No wallpapers available for cycling")
            return
        
        self.is_cycling = True
        self.is_paused = False
        self.save_cycle_state()
        
        # Only update UI if not in daemon mode
        if not self.daemon_mode:
            self.cycle_button.set_label("Stop Cycling")
            self.next_button.set_sensitive(True)
            self.pause_button.set_sensitive(True)
            self.pause_button.set_label("Pause Cycling")
        
        # Initialize wallpaper list order
        if self.is_random_order:
            # Create a shuffled copy of the list
            self.cycling_wallpapers = self.wallpaper_list.copy()
            random.shuffle(self.cycling_wallpapers)
            self.current_index = 0
        else:
            self.cycling_wallpapers = self.wallpaper_list.copy()
            # Start from current wallpaper if it exists in the list
            if self.current_wallpaper and self.current_wallpaper in self.cycling_wallpapers:
                self.current_index = self.cycling_wallpapers.index(self.current_wallpaper)
            else:
                self.current_index = 0
        
        # Start the cycling timer
        self.schedule_next_cycle()
        
        # Update status
        minutes = self.cycle_interval // 60
        time_str = f"{minutes} minute{'s' if minutes != 1 else ''}"
        order_str = "random" if self.is_random_order else "sequential"
        
        if not self.daemon_mode:
            self.cycle_status_label.set_label(f"Cycling every {time_str} in {order_str} order")
        else:
            print(f"Cycling every {time_str} in {order_str} order")

    def stop_cycling(self):
        """Stop the wallpaper cycling"""
        self.is_cycling = False
        self.is_paused = False
        self.save_cycle_state()
        
        # Only update UI if not in daemon mode
        if not self.daemon_mode:
            self.cycle_button.set_label("Start Cycling")
            self.next_button.set_sensitive(False)
            self.pause_button.set_sensitive(False)
        
        # Cancel the timer
        if self.cycle_timeout_id:
            GLib.source_remove(self.cycle_timeout_id)
            self.cycle_timeout_id = None
        
        if not self.daemon_mode:
            self.cycle_status_label.set_label("Cycling stopped")
        else:
            print("Cycling stopped")

    def pause_cycling(self):
        self.is_paused = True
        self.save_cycle_state()
        self.update_cycle_ui()

    def resume_cycling(self):
        self.is_paused = False
        self.save_cycle_state()
        self.update_cycle_ui()

    def schedule_next_cycle(self):
        """Schedule the next wallpaper change"""
        if self.cycle_timeout_id:
            GLib.source_remove(self.cycle_timeout_id)
        self.cycle_countdown = self.cycle_interval
        self.cycle_timeout_id = GLib.timeout_add_seconds(1, self.on_cycle_countdown)

    def on_cycle_countdown(self):
        if not self.is_cycling or self.is_paused:
            return True
        self.cycle_countdown -= 1
        self.update_cycle_ui()
        if self.cycle_countdown <= 0:
            self.on_cycle_timeout()
            self.cycle_countdown = self.cycle_interval
        return True

    def on_cycle_timeout(self):
        """Handle the cycling timeout"""
        if not self.is_cycling or self.is_paused:
            return False  # Stop the timeout
        
        self.cycle_to_next_wallpaper()
        return True  # Continue the timeout

    def cycle_to_next_wallpaper(self):
        """Cycle to the next wallpaper"""
        if not self.cycling_wallpapers:
            return
        
        # Move to next wallpaper
        self.current_index = (self.current_index + 1) % len(self.cycling_wallpapers)
        
        # If we completed a full cycle in random mode, reshuffle
        if self.is_random_order and self.current_index == 0:
            random.shuffle(self.cycling_wallpapers)
        
        # Set the new wallpaper
        next_wallpaper = self.cycling_wallpapers[self.current_index]
        self.current_wallpaper = next_wallpaper

        # Multi-monitor: set wallpaper for all monitors
        for monitor in self.monitors:
            self.set_wallpaper_for_monitor(monitor, next_wallpaper)

        # Time-of-day: override if set
        tod = self.get_time_of_day()
        tod_wallpaper = self.time_of_day_wallpapers.get(tod)
        if tod_wallpaper:
            self.current_wallpaper = tod_wallpaper
            for monitor in self.monitors:
                self.set_wallpaper_for_monitor(monitor, tod_wallpaper)
        
        # Apply the wallpaper
        try:
            # Always update the hyprpaper config first for persistence
            self.update_hyprpaper_config()
            
            # Then, try to apply via IPC for an immediate change
            self.apply_hyprpaper_via_ipc()

            # Always update the hyprlock config for persistence and then restart hyprlock
            self.apply_hyprlock_wallpaper()
            subprocess.run(["pkill", "hyprlock"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            
            # Update UI selection to match current wallpaper (only if not in daemon mode)
            if not self.daemon_mode:
                self.update_ui_selection()
            
            # Update status
            wallpaper_name = os.path.basename(next_wallpaper)
            if not self.daemon_mode:
                self.status_label.set_label(f"Cycled to: {wallpaper_name}")
                self.show_notification(f"Wallpaper changed to {wallpaper_name}")
            else:
                print(f"Cycled to: {wallpaper_name}")
                
        except Exception as e:
            error_msg = f"Error cycling wallpaper: {e}"
            if not self.daemon_mode:
                self.status_label.set_label(error_msg)
            else:
                print(error_msg)
        self.update_cycle_ui()

    def set_wallpaper_for_monitor(self, monitor, wallpaper):
        # For hyprpaper, use monitor-specific wallpaper config
        try:
            subprocess.run([
                "hyprctl", "hyprpaper", "preload", f"{wallpaper}"
            ], check=True, text=True, timeout=10, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            subprocess.run([
                "hyprctl", "hyprpaper", "wallpaper", f"{monitor},{wallpaper}"
            ], check=True, text=True, timeout=10, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        except Exception as e:
            print(f"Monitor wallpaper error: {e}")

    def update_ui_selection(self):
        """Update the UI to show the currently applied wallpaper as selected"""
        if not self.current_wallpaper:
            return
        
        # Find and select the corresponding thumbnail
        for child in self.flow_box:
            if child in self.thumbnails and self.thumbnails[child] == self.current_wallpaper:
                self.flow_box.select_child(child)
                break

    def on_window_realize(self, widget):
        """
        Handles the 'realize' signal of the window. This is the first time the window is shown.
        """
        print("--- App starting, checking config file... ---")
        last_folder = None
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    last_folder = f.read().strip()
            except Exception as e:
                print(f"Error reading config file: {e}")
        print(f"Path read from config: '{last_folder}'")

        # Use the last_folder if valid, otherwise use default
        if last_folder and os.path.exists(last_folder):
            self.wallpaper_dir = last_folder
            self.load_wallpapers(self.wallpaper_dir)
        else:
            self.load_wallpapers(self.wallpaper_dir)
            
        # Check systemd service status
        service_path = os.path.expanduser("~/.config/systemd/user/pyprwall.service")
        if os.path.exists(service_path):
            self.systemd_button.set_label("Disable Auto-Start")
        else:
            self.systemd_button.set_label("Enable Auto-Start")

        # Update UI based on saved cycle state
        if self.is_cycling:
            # Update UI elements to reflect cycling state
            self.cycle_button.set_label("Stop Cycling")
            self.next_button.set_sensitive(True)
            self.pause_button.set_sensitive(True)
            
            if self.is_paused:
                self.pause_button.set_label("Resume Cycling")
                self.cycle_status_label.set_label("Cycling paused")
            else:
                self.pause_button.set_label("Pause Cycling")
                # Start the cycling timer if not in paused state
                self.start_cycling()
        else:
            self.cycle_button.set_label("Start Cycling")
            self.next_button.set_sensitive(False)
            self.pause_button.set_sensitive(False)

    def on_open_clicked(self, button):
        """
        Callback for the 'Open Folder' button. Opens a file chooser dialog.
        """
        # Stop cycling when changing folders
        if self.is_cycling:
            self.stop_cycling()
        
        # Create file chooser dialog
        dialog = Gtk.FileChooserDialog(
            title="Select Wallpaper Folder",
            parent=self.win,
            action=Gtk.FileChooserAction.SELECT_FOLDER
        )
        dialog.add_buttons(
            "Cancel", Gtk.ResponseType.CANCEL,
            "Select", Gtk.ResponseType.OK
        )
        
        # Set default folder to Pictures/Wallpapers
        dialog.set_file(Gio.File.new_for_path(self.wallpaper_dir))
        
        # Use show() instead of run() and connect to the response signal
        dialog.connect("response", self.on_file_dialog_response)
        dialog.show()

    def on_preview_clicked(self, button):
        """
        Callback for the 'Preview' button. Shows a larger preview of the selected wallpaper.
        """
        if not self.current_wallpaper:
            return
            
        # Create a preview dialog
        dialog = Gtk.Dialog(
            title="Wallpaper Preview",
            parent=self.win,
            modal=True
        )
        dialog.set_default_size(800, 600)
        
        # Create a scrolled window for the preview
        scrolled = Gtk.ScrolledWindow()
        scrolled.set_vexpand(True)
        scrolled.set_hexpand(True)
        dialog.get_content_area().append(scrolled)
        
        # Load the full image for preview
        try:
            pixbuf = GdkPixbuf.Pixbuf.new_from_file(self.current_wallpaper)
            preview_image = Gtk.Image.new_from_pixbuf(pixbuf)
            scrolled.set_child(preview_image)
        except Exception as e:
            error_label = Gtk.Label(label=f"Error loading preview: {e}")
            scrolled.set_child(error_label)
        
        # Add a close button
        dialog.add_button("Close", Gtk.ResponseType.CLOSE)
        dialog.connect("response", lambda d, r: d.destroy())
        
        dialog.show()

    def on_file_dialog_response(self, dialog, response):
        """
        Callback for the file chooser dialog response.
        """
        if response == Gtk.ResponseType.OK:
            folder = dialog.get_file().get_path()
            self.wallpaper_dir = folder
            # Save the newly selected folder to the config file
            try:
                with open(self.config_file, 'w') as f:
                    f.write(folder)
            except Exception as e:
                print(f"Error writing config file: {e}")
            self.load_wallpapers(folder)
        dialog.destroy()

    def get_wallpaper_folder_meta(self, folder_path):
        """Return a dict with folder mtime and file list for change detection."""
        try:
            stat = os.stat(folder_path)
            mtime = stat.st_mtime
            files = sorted([f for f in os.listdir(folder_path)
                           if os.path.isfile(os.path.join(folder_path, f))])
            return {"mtime": mtime, "files": files}
        except Exception:
            return None

    def is_cache_valid(self, folder_path):
        """Check if cache meta matches current folder meta."""
        if not os.path.exists(self.wallpaper_cache_meta_file):
            return False
        try:
            with open(self.wallpaper_cache_meta_file, 'r') as f:
                cached_meta = json.load(f)
            current_meta = self.get_wallpaper_folder_meta(folder_path)
            return cached_meta == current_meta
        except Exception:
            return False

    def save_wallpaper_cache(self, folder_path, wallpaper_list):
        """Save wallpaper list and meta to cache files."""
        try:
            with open(self.wallpaper_cache_file, 'w') as f:
                json.dump(wallpaper_list, f)
            meta = self.get_wallpaper_folder_meta(folder_path)
            with open(self.wallpaper_cache_meta_file, 'w') as f:
                json.dump(meta, f)
        except Exception as e:
            print(f"Error saving wallpaper cache: {e}")

    def load_wallpaper_cache(self):
        """Load wallpaper list from cache file."""
        try:
            with open(self.wallpaper_cache_file, 'r') as f:
                return json.load(f)
        except Exception:
            return []

    def get_thumbnail_cache_path(self, wallpaper_path):
        import hashlib
        h = hashlib.sha256(wallpaper_path.encode()).hexdigest()
        return os.path.join(self.thumbnail_cache_dir, f'{h}.png')
    
    def load_or_create_thumbnail(self, wallpaper_path):
        cache_path = self.get_thumbnail_cache_path(wallpaper_path)
        if os.path.exists(cache_path):
            try:
                pixbuf = GdkPixbuf.Pixbuf.new_from_file(cache_path)
                return pixbuf
            except Exception:
                pass  # fallback to regeneration
        try:
            pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_size(wallpaper_path, THUMB_WIDTH, THUMB_HEIGHT)
            # Save to cache as PNG
            try:
                pixbuf.savev(cache_path, 'png', [], [])
            except Exception as e:
                print(f"Error saving thumbnail cache for {wallpaper_path}: {e}")
            return pixbuf
        except Exception as e:
            print(f"Error generating thumbnail for {wallpaper_path}: {e}")
            return None

    def load_wallpapers(self, folder_path):
        """
        Loads wallpapers from a specified folder and displays them as thumbnails, in a background thread.
        Uses cache if available and valid.
        """
        self.spinner.start()
        self.status_label.set_label(f"Loading from {os.path.basename(folder_path)}...")

        def do_load():
            # Clear existing thumbnails and wallpaper list (in main thread)
            def clear_thumbnails():
                while self.flow_box.get_first_child() is not None:
                    self.flow_box.remove(self.flow_box.get_first_child())
                self.thumbnails = {}
                self.wallpaper_list = []
            GLib.idle_add(clear_thumbnails)

            supported_formats = ['.png', '.jpg', '.jpeg', '.jxl', '.webp']
            use_cache = self.is_cache_valid(folder_path)
            if use_cache:
                wallpapers = self.load_wallpaper_cache()
            else:
                try:
                    wallpapers = [f for f in os.listdir(folder_path)
                                 if os.path.isfile(os.path.join(folder_path, f)) and
                                 os.path.splitext(f)[1].lower() in supported_formats]
                except Exception as e:
                    GLib.idle_add(self.status_label.set_label, f"Error reading folder: {e}")
                    GLib.idle_add(self.spinner.stop)
                    return
                wallpapers.sort()
                # Save cache with full paths
                full_paths = [os.path.join(folder_path, f) for f in wallpapers]
                self.save_wallpaper_cache(folder_path, full_paths)
                wallpapers = full_paths

            if not wallpapers:
                GLib.idle_add(self.status_label.set_label, "No wallpapers found in selected folder")
                GLib.idle_add(self.spinner.stop)
                GLib.idle_add(lambda: self.cycle_button.set_sensitive(False))
                return

            for full_path in wallpapers:
                GLib.idle_add(lambda p=full_path: self.wallpaper_list.append(p))
                try:
                    pixbuf = self.load_or_create_thumbnail(full_path)
                    if pixbuf is None:
                        continue
                    thumbnail = Gtk.Image.new_from_pixbuf(pixbuf)
                    thumbnail.set_size_request(THUMB_WIDTH, THUMB_HEIGHT)
                    box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
                    box.set_valign(Gtk.Align.START)
                    try:
                        box.set_margin_top(10)
                        box.set_margin_bottom(10)
                        box.set_margin_start(10)
                        box.set_margin_end(10)
                    except Exception:
                        pass
                    box.set_tooltip_text(os.path.basename(full_path))
                    label = Gtk.Label(label=os.path.basename(full_path))
                    label.set_max_width_chars(LABEL_MAX_CHARS)
                    label.set_ellipsize(Pango.EllipsizeMode.END)
                    label.set_wrap(False)
                    label.set_halign(Gtk.Align.CENTER)
                    box.append(thumbnail)
                    box.append(label)
                    child = Gtk.FlowBoxChild()
                    child.set_child(box)
                    def add_child(child=child, full_path=full_path):
                        self.flow_box.append(child)
                        self.thumbnails[child] = full_path
                    GLib.idle_add(add_child)
                except Exception as e:
                    print(f"Error loading thumbnail for {full_path}: {e}")

            def finish_loading():
                self.spinner.stop()
                self.status_label.set_label("Select a wallpaper to apply or start cycling.")
                self.cycle_button.set_sensitive(len(self.wallpaper_list) > 0)
                
                # If we have a current wallpaper from saved state, select it
                if self.current_wallpaper and self.current_wallpaper in self.wallpaper_list:
                    for child in self.flow_box:
                        if child in self.thumbnails and self.thumbnails[child] == self.current_wallpaper:
                            self.flow_box.select_child(child)
                            break
            GLib.idle_add(finish_loading)

        thread = self.threading.Thread(target=do_load)
        thread.daemon = True
        thread.start()

    def on_wallpaper_selected(self, flow_box):
        """
        Handles selection changes in the flow box. Only one child can be selected at a time.
        """
        selected = flow_box.get_selected_children()
        if selected:
            child = selected[0]
            if child in self.thumbnails:
                self.current_wallpaper = self.thumbnails[child]
                self.apply_button.set_sensitive(True)
                self.preview_button.set_sensitive(True)
                # Highlight selected
                for c in self.flow_box:
                    c.get_style_context().remove_class("thumbnail-selected")
                child.get_style_context().add_class("thumbnail-selected")
        else:
            self.current_wallpaper = None
            self.apply_button.set_sensitive(False)
            self.preview_button.set_sensitive(False)

    def on_apply_clicked(self, button):
        """
        Callback for the 'Apply' button. Applies the selected wallpaper.
        """
        if not self.current_wallpaper:
            self.status_label.set_label("No wallpaper selected!")
            return
            
        try:
            # Always update the hyprpaper config first for persistence
            self.update_hyprpaper_config()
            
            # Then, try to apply via IPC for an immediate change
            self.apply_hyprpaper_via_ipc()

            # Always update the hyprlock config for persistence and then restart hyprlock
            self.apply_hyprlock_wallpaper()
            subprocess.run(["pkill", "hyprlock"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            
            self.status_label.set_label(f"Applied {os.path.basename(self.current_wallpaper)} to desktop and lockscreen!")
            
        except Exception as e:
            self.status_label.set_label(f"Error applying wallpaper: {e}")

    def apply_hyprpaper_via_ipc(self):
        """Try applying wallpaper to hyprpaper using IPC commands."""
        try:
            # Preload the new wallpaper
            subprocess.run([
                "hyprctl", "hyprpaper", "preload", 
                f"{self.current_wallpaper}"
            ], check=True, text=True, timeout=10, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

            # Set the wallpaper
            subprocess.run([
                "hyprctl", "hyprpaper", "wallpaper", 
                f",{self.current_wallpaper}"
            ], check=True, text=True, timeout=10, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                
        except (FileNotFoundError, subprocess.CalledProcessError, subprocess.TimeoutExpired, Exception) as e:
            print(f"IPC method failed: {e}. The config file has been updated for persistence.")
            # No further action needed as update_hyprpaper_config() was already called.

    def update_hyprpaper_config(self):
        """Update hyprpaper config file with new wallpaper."""
        config_content = []
        
        # Read existing config if it exists
        if os.path.exists(self.hyprpaper_conf):
            with open(self.hyprpaper_conf, 'r') as f:
                config_content = f.readlines()
        
        # Remove existing preload and wallpaper lines
        new_content = []
        for line in config_content:
            stripped_line = line.strip()
            if not stripped_line.startswith(('preload =', 'wallpaper =')):
                new_content.append(line)
        
        # Add new wallpaper configuration
        new_content.append(f"preload = {self.current_wallpaper}\n")
        new_content.append(f"wallpaper = ,{self.current_wallpaper}\n")
        
        # Write updated config
        with open(self.hyprpaper_conf, 'w') as f:
            f.writelines(new_content)
        
        # NOTE: We no longer pkill -SIGUSR2 here. The IPC command handles immediate change.
        # This is for persistence only.

    def apply_hyprlock_wallpaper(self):
        """
        Update hyprlock configuration to use the same wallpaper by only
        modifying the 'background' block.
        """
        # Read existing hyprlock config
        try:
            with open(self.hyprlock_conf, 'r') as f:
                content = f.readlines()
        except FileNotFoundError:
            # If file doesn't exist, create a basic one
            base_config = f"""
background {{
    monitor =
    path = {self.current_wallpaper}
    color = rgba(25, 20, 20, 1.0)
    blur_size = 8
    blur_passes = 3
    noise = 0.0117
    contrast = 1.3000
    brightness = 0.8000
    vibrancy = 0.2100
    vibrancy_darkness = 0.0
}}

label {{
    monitor =
    text = $USER
    color = rgba(200, 200, 200, 1.0)
    font_size = 25
    font_family = Inter
    position = 0, 80
    halign = center
    valign = center
}}
"""
            with open(self.hyprlock_conf, 'w') as f:
                f.write(base_config)
            return

        new_content = []
        in_background_section = False
        path_updated = False
        
        for line in content:
            stripped_line = line.strip()

            if stripped_line.startswith('background {'):
                in_background_section = True
                new_content.append(line)
            elif in_background_section and stripped_line == '}':
                # Add path if it was not found and then close the section
                if not path_updated:
                    new_content.insert(-1, f"    path = {self.current_wallpaper}\n")
                in_background_section = False
                new_content.append(line)
            elif in_background_section and stripped_line.startswith('path ='):
                new_content.append(f"    path = {self.current_wallpaper}\n")
                path_updated = True
            else:
                new_content.append(line)
        
        # Write updated config
        with open(self.hyprlock_conf, 'w') as f:
            f.writelines(new_content)

def main():
    """
    Main function to run the application.
    """
    parser = argparse.ArgumentParser(description='PyprWall - Hyprland Wallpaper Manager')
    parser.add_argument('--cycle-daemon', action='store_true', 
                       help='Run in daemon mode for wallpaper cycling')
    args = parser.parse_args()
    
    if args.cycle_daemon:
        # Run in daemon mode
        app = WallpaperManager(application_id="com.reeves.pyprwall")
        app.run_daemon()
        return
    
    # Load CSS for styling
    css_provider = Gtk.CssProvider()
    css = """
    .thumbnail-selected {
        border: 3px solid #3584e4;
        border-radius: 5px;
        background-color: rgba(53, 132, 228, 0.1);
    }
    flowboxchild {
        padding: 5px;
    }
    """
    css_provider.load_from_data(css.encode())
    Gtk.StyleContext.add_provider_for_display(
        Gdk.Display.get_default(),
        css_provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
    )

    app = WallpaperManager(application_id="com.reeves.pyprwall")
    app.run()

if __name__ == "__main__":
    main()