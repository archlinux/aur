import asyncio
import json
import subprocess
import os
import signal
import fcntl
import time
import gi
import logging
import base64
from typing import Optional, List, Dict

gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
gi.require_version("Soup", "3.0")
from gi.repository import Gtk, Gdk, Gio, GLib, Adw, Soup

import utils
import flm
import ui
import sessions
import network
import theme
import handlers
import models
import display

APP_ID = "com.marley.FastFlowLM-gtk"
DEFAULT_PORT = 52625
BASE_URL = f"http://127.0.0.1:{DEFAULT_PORT}/v1"

class FlmChatApp(Adw.Application):
    """
    Main application controller for FastFlowLM-gtk.
    Manages application state, lifecycle, and coordinates between UI/data modules.
    """
    def __init__(self):
        super().__init__(application_id=APP_ID, flags=Gio.ApplicationFlags.FLAGS_NONE)
        self.server_process: Optional[subprocess.Popen] = None
        self.css_provider = Gtk.CssProvider()
        self.ai_task: Optional[asyncio.Task] = None
        self.theme_color: str = theme.load_theme_color()
        self.models: List[Dict] = flm.get_all_models()
        self.current_model: Optional[str] = None
        self.utils = utils

        self.downloading_models = set()
        self.tasks = set()
        self.session = Soup.Session()
        self.history = []
        self.status_labels = []
        self.selected_image_path: Optional[str] = None
        
        self.history_dir = os.path.expanduser("~/.config/flm/history")
        os.makedirs(self.history_dir, exist_ok=True)
        self.current_session_id: Optional[str] = None
        self.sessions_metadata = []
        self.allow_mid_chat_switch = False
        self.is_sending = False
        self.BASE_URL = BASE_URL
        
        self.lock_fd = None
        self.acquire_system_lock()

    def acquire_system_lock(self) -> None:
        """Acquires a file lock to manage system model resource usage."""
        lock_path = os.path.expanduser("~/.config/flm/model_ram.lock")
        try:
            self.lock_fd = open(lock_path, 'w')
            fcntl.flock(self.lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except (BlockingIOError, IOError):
            print("Warning: Another instance is managing the system models.")

    def do_activate(self) -> None:
        """Initializes the main window and UI components."""
        Adw.StyleManager.get_default().set_color_scheme(Adw.ColorScheme.PREFER_DARK)
        
        # Populate models first before any UI logic
        self.models = flm.get_all_models()
        
        action_switch = Gio.SimpleAction.new_stateful("allow_switch", None, GLib.Variant.new_boolean(False))
        action_switch.connect("activate", self.on_allow_switch_toggled)
        self.add_action(action_switch)

        action_clear = Gio.SimpleAction.new("clear_history", None)
        action_clear.connect("activate", self.on_clear_history)
        self.add_action(action_clear)

        action_color = Gio.SimpleAction.new("choose_color", None)
        action_color.connect("activate", self.on_choose_color)
        self.add_action(action_color)

        self.win = Adw.ApplicationWindow(application=self)
        self.win.set_default_size(900, 800)
        self.win.set_title("FastFlowLM-gtk")
        
        self.css_provider.load_from_data(utils.CSS.encode())
        theme.apply_theme(self, self.theme_color)
        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            self.css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )


        self.split_view = Adw.OverlaySplitView()
        self.split_view.set_sidebar_width_fraction(0.3)
        self.split_view.set_min_sidebar_width(200)
        self.win.set_content(self.split_view)

        self.sidebar_box = ui.build_sidebar(self)
        self.split_view.set_sidebar(self.sidebar_box)

        self.main_box = ui.build_main_content(self)
        self.split_view.set_content(self.main_box)

        menu = Gio.Menu.new()
        menu.append("Allow Mid-Chat Switch", "app.allow_switch")
        menu.append("Clear All History", "app.clear_history")
        menu.append("Choose Accent Color", "app.choose_color")
        self.options_btn.set_menu_model(menu)

        # Ensure initial state is set before the window appears
        self.update_model_ui()
        self.show_welcome_message()

        self.win.present()
        
        # Apply theme after window is present
        theme.apply_theme(self, self.theme_color)
        
        GLib.idle_add(lambda: sessions.load_history_metadata(self))
        GLib.idle_add(lambda: self.run_task(self.init_server()))

    def on_search_changed(self, entry):
        text = entry.get_text().lower()
        if not hasattr(self, '_search_cache'):
            self._search_cache = {}
        
        for i, row in enumerate(self.history_list):
            session_id = self.sessions_metadata[i]["id"]
            path = os.path.join(self.history_dir, f"{session_id}.json")
            
            if session_id not in self._search_cache:
                try:
                    with open(path, 'r') as f:
                        data = json.load(f)
                        self._search_cache[session_id] = data.get("messages", [])
                except Exception as e:
                    logging.error(f"Failed to cache session {session_id}: {e}")
                    self._search_cache[session_id] = []
            
            messages = self._search_cache[session_id]
            
            main_box = row.get_child()
            txt_box = main_box.get_first_child()
            title_label = txt_box.get_first_child()
            model_label = title_label.get_next_sibling()
            
            if not text:
                row.set_visible(True)
                model_label.set_label(self.sessions_metadata[i]["model"])
                continue
                
            found_text = None
            for msg in messages:
                content = msg.get("content", "")
                if text in content.lower():
                    start_idx = content.lower().find(text)
                    preview = content[start_idx:start_idx+40]
                    found_text = f"{preview}..."
                    break
            
            row.set_visible(found_text is not None)
            if found_text:
                model_label.set_label(found_text)

    def on_attach_clicked(self, btn):
        handlers.on_attach_clicked(self, btn)

    def on_file_selected(self, dialog, response):
        handlers.on_file_selected(self, dialog, response)

    def update_thumbnail(self):
        return display.update_thumbnail(self)

    def on_remove_thumbnail(self, btn):
        return display.on_remove_thumbnail(self)

    def on_allow_switch_toggled(self, action, value):
        handlers.on_allow_switch_toggled(self, action, value)

    def complete_switch_toggle(self, action, response):
        handlers.complete_switch_toggle(self, action, response)

    def run_task(self, coro):
        task = asyncio.create_task(coro)
        self.tasks.add(task)
        task.add_done_callback(self.tasks.discard)

    def is_current_model_capable(self) -> bool:
        return self.is_current_model_vlm()

    def is_current_model_vlm(self) -> bool:
        if not self.current_model: return False
        model_data = next((m for m in self.models if m["model"] == self.current_model), None)
        return model_data is not None and model_data.get("vlm", False)

    def on_repair_clicked(self, btn):
        if not self.current_model:
            return
        model_data = next((m for m in self.models if m['model'] == self.current_model), None)
        if model_data:
            models.confirm_download(self, model_data)

    def update_model_ui(self):
        models.update_model_ui(self)
        # Handle repair button visibility/sensitivity
        self.btn_repair.set_sensitive(self.current_model is not None and self.current_model != "none")

    def on_row_activated(self, listbox, row, popover):
        return models.on_row_activated(self, listbox, row, popover)

    def on_model_selected(self, btn, model_data, popover):
        return models.on_model_selected(self, btn, model_data, popover)

    def init_server(self):
        return models.init_server(self)

    def wait_for_server(self):
        return models.wait_for_server(self)

    def confirm_download(self, model_data):
        return models.confirm_download(self, model_data)

    def on_download_response(self, dialog, response, model_name):
        return models.on_download_response(self, dialog, response, model_name)

    def download_model(self, model_name):
        return models.download_model(self, model_name)

    def update_history_ui(self):
        child = self.history_list.get_first_child()
        while child:
            next_child = child.get_next_sibling()
            self.history_list.remove(child)
            child = next_child
        
        for meta in self.sessions_metadata:
            row = Gtk.ListBoxRow()
            main_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
            main_box.set_margin_start(10)
            main_box.set_margin_end(5)
            main_box.set_margin_top(10)
            main_box.set_margin_bottom(10)
            
            txt_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
            txt_box.set_hexpand(True)
            
            title = Gtk.Label(label=meta["title"])
            title.set_halign(Gtk.Align.START)
            title.set_ellipsize(3)
            title.set_max_width_chars(24)
            title.add_css_class("sidebar-title")
            
            model_label = meta["model"]
            model_data = next((m for m in self.models if m['model'] == meta["model"]), None)
            if model_data and model_data.get('vlm', False):
                model_label = "👁 " + model_label
            
            model = Gtk.Label(label=model_label)
            model.set_halign(Gtk.Align.START)
            model.set_ellipsize(3)
            model.add_css_class("sidebar-subtitle")
            model.add_css_class("dim-label")
            
            txt_box.append(title)
            txt_box.append(model)
            main_box.append(txt_box)
            
            del_btn = Gtk.Button(icon_name="user-trash-symbolic")
            del_btn.add_css_class("delete-btn")
            del_btn.set_has_frame(False)
            del_btn.set_tooltip_text("Delete Chat")
            del_btn.connect("clicked", self.on_delete_clicked, meta["id"])
            main_box.append(del_btn)
            
            row.set_child(main_box)
            self.history_list.append(row)

    def execute_new_chat(self):
        self.save_session()
        self.execute_eject()
        self.entry.get_buffer().set_text("")
        display.chat_box_remove_all(self)
        self.history = []
        self.current_session_id = str(int(time.time()))
        # Re-enable model selection and input
        self.model_btn.set_sensitive(True)
        self.entry.set_sensitive(True)
        self.btn_send.set_sensitive(True)
        self.update_model_ui()
        display.add_system_message(self, "New session started.")

    def execute_eject(self):
        if self.server_process:
            self.server_process.terminate()
            self.server_process = None
        self.current_model = None
        self.entry.set_sensitive(False)
        self.btn_send.set_sensitive(False)
        self.model_btn.set_label("Select a model to start")
        self.update_model_ui()

    def on_delete_clicked(self, btn, session_id):
        handlers.on_delete_clicked(self, btn, session_id)

    def on_delete_response(self, dialog, response, session_id):
        handlers.on_delete_response(self, dialog, response, session_id)

    def on_clear_history(self, action, value):
        handlers.on_clear_history(self, action, value)

    def on_clear_history_response(self, dialog, response):
        handlers.on_clear_history_response(self, dialog, response)

    def on_history_row_activated(self, listbox, row):
        handlers.on_history_row_activated(self, listbox, row)

    def on_switch_dialog_response(self, dialog, response, session_id):
        handlers.on_switch_dialog_response(self, dialog, response, session_id)

    def save_session(self):
        sessions.save_session(self)

    async def load_session(self, session_id):
        self.models = flm.get_all_models()
        path = os.path.join(self.history_dir, f"{session_id}.json")
        try:
            with open(path, 'r') as f:
                data = json.load(f)
                self.current_session_id = session_id
                self.history = data.get("messages", [])
                self.current_model = data.get("model")
                
                display.chat_box_remove_all(self)
                
                for msg in self.history:
                    display.add_message(self, msg.get("content", ""), msg["role"] == "user", msg.get("image"))
                
                model_data = next((m for m in self.models if m['model'] == self.current_model), None)
                
                if self.current_model and self.current_model != "none":
                    if model_data and model_data.get('installed', False):
                        self.model_btn.set_label(self.current_model)
                        display.add_system_message(self, "Resources clearing... please wait.")
                        await asyncio.sleep(1.5)
                        self.server_process = flm.start_flm_serve(self.current_model, self.server_process)
                        self.run_task(self.wait_for_server())
                    else:
                        # Model not installed or missing
                        dialog = Adw.MessageDialog(
                            transient_for=self.win,
                            heading="Model Missing",
                            body=f"The model '{self.current_model}' used in this session is not installed. Would you like to download it?"
                        )
                        dialog.add_response("cancel", "No, keep model unloaded")
                        dialog.add_response("download", "Download")
                        dialog.set_response_appearance("download", Adw.ResponseAppearance.SUGGESTED)
                        dialog.connect("response", self.on_missing_model_response)
                        dialog.present()
                
                self.update_model_ui()
        except Exception as e:
            display.add_system_message(self, f"Error loading session: {e}")

    def on_missing_model_response(self, dialog, response):
        if response == "download":
            model_data = next((m for m in self.models if m['model'] == self.current_model), None)
            if model_data:
                models.confirm_download(self, model_data)
            else:
                display.add_system_message(self, "Error: Model not found in registry.")
        else:
            # Keep the model name selected but input will be disabled by update_model_ui
            self.update_model_ui()
        dialog.destroy()

    def on_new_chat(self, btn):
        if not self.history:
            self.execute_new_chat()
            return
            
        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Start New Chat?",
            body="Starting a new chat will clear the current conversation. Continue?"
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("new", "Start New Chat")
        dialog.set_response_appearance("new", Adw.ResponseAppearance.SUGGESTED)
        dialog.connect("response", self.on_new_chat_response)
        dialog.present()

    def on_new_chat_response(self, dialog, response):
        if response == "new":
            self.execute_new_chat()

    def show_welcome_message(self):
        ui.show_welcome_message(self)

    def on_key_pressed(self, ctrl, keyval, keycode, state):
        return handlers.on_key_pressed(self, ctrl, keyval, keycode, state)

    def on_send(self, widget):
        handlers.on_send(self, widget)

    def unlock_ui(self):
        """Restores user interaction capabilities to the input area."""
        self.input_box.set_sensitive(True)
        self.entry.set_editable(True)
        self.btn_attach.set_sensitive(self.is_current_model_capable())
        self.entry.grab_focus()
        self.is_sending = False

    async def get_ai_response(self):
        thinking_box = None
        try:
            if not self.current_model:
                display.add_system_message(self, "Please select a model first.")
                return
            
            # Final safety check: is the server actually responsive?
            if not flm.is_server_ready(self.current_model):
                display.add_system_message(self, "Error: Model server is not responding. Try reloading the model.")
                return

            thinking_box = display.add_spinner(self)
            
            bubble = display.add_message(self, "", is_user=False)
            full_content = ""
            
            messages = []
            for msg in self.history:
                role = msg["role"]
                text_content = msg.get("content", "")
                
                # Merge consecutive messages from the same role to prevent backend crashes
                if messages and messages[-1]["role"] == role:
                    # Append text to existing last message
                    current_content = messages[-1]["content"]
                    for item in current_content:
                        if item["type"] == "text":
                            item["text"] += "\n" + text_content
                            break
                    else:
                        current_content.append({"type": "text", "text": text_content})
                else:
                    content = [{"type": "text", "text": text_content}]
                    messages.append({"role": role, "content": content})

                # Handle images (for the current or merged message)
                if msg.get("image"):
                    try:
                        with open(msg["image"], "rb") as image_file:
                            encoded = base64.b64encode(image_file.read()).decode('utf-8')
                            # Images are always appended to the current message's content
                            messages[-1]["content"].append({
                                "type": "image_url", 
                                "image_url": {"url": f"data:image/jpeg;base64,{encoded}"}
                            })
                    except Exception as e:
                        logging.error(f"Error encoding image: {e}")

            stream = await network.get_ai_response(self, bubble, thinking_box, messages)
            if not stream:
                display.add_system_message(self, "Error: Connection lost or network endpoint failed.")
                if thinking_box and thinking_box.get_parent() == self.chat_box:
                    self.chat_box.remove(thinking_box)
                
                # Safely remove the empty assistant bubble container
                parent = bubble.get_parent()
                if parent:
                    align = parent.get_parent()
                    if align and align.get_parent() == self.chat_box:
                        self.chat_box.remove(align)
                return
                
            try:
                data_stream = Gio.DataInputStream.new(stream)
                while True:
                    line_bytes, length = await data_stream.read_line_async(GLib.PRIORITY_DEFAULT, None)
                    if line_bytes is None: break
                    
                    line = line_bytes.decode('utf-8').strip()
                    if not line: continue
                    if line.startswith("data: "):
                        content = line[6:]
                        if content == "[DONE]": break
                        
                        try:
                            chunk = json.loads(content)
                            if 'choices' in chunk and len(chunk['choices']) > 0:
                                text = chunk['choices'][0].get('delta', {}).get('content')
                                if text:
                                    if thinking_box and thinking_box.get_parent() == self.chat_box:
                                        self.chat_box.remove(thinking_box)
                                    full_content += text
                                    markup = utils.markdown_to_pango(full_content)
                                    GLib.idle_add(bubble.set_markup, markup)
                            display.scroll_to_bottom(self)
                        except json.JSONDecodeError as e:
                            logging.error(f"JSON parsing error: {e}")
                    else:
                        logging.warning(f"Unexpected stream line format: {line}")
            except Exception as e:
                logging.error(f"Stream reading error: {e}")
            finally:
                stream.close(None)
            
            self.history.append({"role": "assistant", "content": full_content})
            self.save_session()
        except asyncio.CancelledError:
            raise
        except Exception as e:
            logging.error(f"Connection mapping error: {str(e)}")
        finally:
            self.is_sending = False
            GLib.idle_add(self.unlock_ui)
            
            if thinking_box and thinking_box.get_parent() == self.chat_box:
                GLib.idle_add(self.chat_box.remove, thinking_box)

    def on_choose_color(self, action, value):
        dialog = Gtk.ColorDialog.new()
        dialog.choose_rgba(self.win, None, None, self.on_color_picked, None)

    def on_color_picked(self, dialog, result, data):
        try:
            color = dialog.choose_rgba_finish(result)
            hex_color = "#{:02x}{:02x}{:02x}".format(int(color.red * 255), int(color.green * 255), int(color.blue * 255))
            theme.apply_theme(self, hex_color)
            
            config_path = os.path.expanduser("~/.config/flm/theme.json")
            with open(config_path, "w") as f:
                json.dump({"accent_color": hex_color}, f)
        except Exception as e:
            logging.error(f"Error applying color: {e}")

    def do_shutdown(self):
        self.save_session()
        if self.server_process:
            self.server_process.terminate()
        flm.kill_existing_servers()
        Adw.Application.do_shutdown(self)
