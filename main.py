import asyncio
import json
import subprocess
import os
import signal
import fcntl
import time
import gi
from typing import Optional, List, Dict

gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
gi.require_version("Soup", "3.0")
from gi.repository import Gtk, Gdk, Gio, GLib, Adw, Soup

import utils
import flm

APP_ID = "com.marley.FastFlowLM-gtk"
DEFAULT_PORT = 52625
BASE_URL = f"http://127.0.0.1:{DEFAULT_PORT}/v1"

class FlmChatApp(Adw.Application):
    def __init__(self):
        super().__init__(application_id=APP_ID, flags=Gio.ApplicationFlags.FLAGS_NONE)
        self.server_process: Optional[subprocess.Popen] = None
        self.css_provider = Gtk.CssProvider()
        self.ai_task = None
        self.theme_color = self.load_theme_color()
        self.models = flm.get_all_models()
        self.current_model = None

        self.downloading_models = set()
        self.tasks = set()
        self.session = Soup.Session()
        self.history = []
        self.status_labels = []
        self.selected_image_path = None
        
        self.history_dir = os.path.expanduser("~/.config/flm/history")
        os.makedirs(self.history_dir, exist_ok=True)
        self.current_session_id = None
        self.sessions_metadata = []
        self.allow_mid_chat_switch = False
        
        self.lock_fd = None
        self.acquire_system_lock()

    def acquire_system_lock(self):
        lock_path = os.path.expanduser("~/.config/flm/model_ram.lock")
        try:
            self.lock_fd = open(lock_path, 'w')
            fcntl.flock(self.lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except (BlockingIOError, IOError):
            print("Warning: Another instance is managing the system models.")

    def do_activate(self):
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
        self.apply_theme(self.theme_color)
        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            self.css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        self.split_view = Adw.OverlaySplitView()
        self.split_view.set_sidebar_width_fraction(0.3)
        self.split_view.set_min_sidebar_width(200)
        self.win.set_content(self.split_view)

        self.sidebar_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.sidebar_box.add_css_class("sidebar-list")
        self.sidebar_header = Adw.HeaderBar()
        self.sidebar_header.set_show_end_title_buttons(False)
        self.sidebar_box.append(self.sidebar_header)
        
        self.search_entry = Gtk.SearchEntry()
        self.search_entry.set_placeholder_text("Search chats...")
        self.search_entry.connect("search-changed", self.on_search_changed)
        self.sidebar_box.append(self.search_entry)

        self.history_list = Gtk.ListBox()
        self.history_list.set_selection_mode(Gtk.SelectionMode.SINGLE)
        self.history_list.connect("row-activated", self.on_history_row_activated)
        
        self.sidebar_scrolled = Gtk.ScrolledWindow()
        self.sidebar_scrolled.set_vexpand(True)
        self.sidebar_scrolled.set_child(self.history_list)
        self.sidebar_box.append(self.sidebar_scrolled)
        self.split_view.set_sidebar(self.sidebar_box)

        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.split_view.set_content(self.main_box)

        self.header = Adw.HeaderBar()
        self.main_box.append(self.header)

        self.btn_sidebar = Gtk.ToggleButton(icon_name="sidebar-show-symbolic")
        self.btn_sidebar.set_tooltip_text("Toggle History")
        self.btn_sidebar.set_active(True)
        self.btn_sidebar.connect("toggled", lambda b: self.split_view.set_show_sidebar(b.get_active()))
        self.header.pack_start(self.btn_sidebar)

        self.btn_new = Gtk.Button(icon_name="document-new-symbolic")
        self.btn_new.set_tooltip_text("New Chat")
        self.btn_new.connect("clicked", self.on_new_chat)
        self.header.pack_start(self.btn_new)
        
        self.options_btn = Gtk.MenuButton(icon_name="view-more-symbolic")
        self.options_btn.set_tooltip_text("Options")
        self.header.pack_start(self.options_btn)
        
        self.options_menu = Gio.Menu()
        self.options_menu.append("Choose Theme Color", "app.choose_color")
        self.options_menu.append("Allow Switching Model mid-chat", "app.allow_switch")
        self.options_menu.append("Clear All History", "app.clear_history")
        self.options_btn.set_menu_model(self.options_menu)

        self.model_btn = Gtk.MenuButton()
        self.model_btn.set_label("Select a model to start")
        self.header.set_title_widget(self.model_btn)
        
        self.scrolled = Gtk.ScrolledWindow()
        self.scrolled.set_vexpand(True)
        self.scrolled.add_css_class("chat-scroll")
        self.chat_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.chat_box.set_margin_top(10)
        self.chat_box.set_margin_bottom(10)
        
        self.scrolled.set_child(self.chat_box)
        self.main_box.append(self.scrolled)

        self.thumb_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        self.thumb_box.set_hexpand(True)
        self.thumb_box.set_margin_start(10)
        self.thumb_box.set_margin_end(10)
        self.thumb_box.set_margin_top(5)
        self.thumb_box.set_margin_bottom(5)
        self.main_box.append(self.thumb_box)

        self.input_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        self.input_box.add_css_class("input-area")
        
        self.input_scroll = Gtk.ScrolledWindow()
        self.input_scroll.set_hexpand(True)
        self.input_scroll.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        self.input_scroll.set_min_content_height(40)
        self.input_scroll.set_max_content_height(150)
        self.input_scroll.add_css_class("input-view")
        
        self.entry = Gtk.TextView()
        self.entry.set_wrap_mode(Gtk.WrapMode.WORD_CHAR)
        self.entry.set_accepts_tab(False)
        self.input_scroll.set_child(self.entry)
        
        key_ctrl = Gtk.EventControllerKey()
        key_ctrl.connect("key-pressed", self.on_key_pressed)
        self.entry.add_controller(key_ctrl)
        
        self.input_box.append(self.input_scroll)
        
        self.btn_send = Gtk.Button(icon_name="mail-send-symbolic")
        self.btn_send.connect("clicked", self.on_send)
        self.btn_send.set_valign(Gtk.Align.END)
        
        self.btn_attach = Gtk.Button(icon_name="paperclip-symbolic")
        self.btn_attach.connect("clicked", self.on_attach_clicked)
        self.btn_attach.set_valign(Gtk.Align.END)
        
        self.input_box.append(self.btn_attach)
        self.input_box.append(self.btn_send)
        
        self.main_box.append(self.input_box)

        # Ensure initial state is set before the window appears
        self.update_model_ui()
        self.show_welcome_message()

        self.win.present()
        
        # Apply theme after window is present
        self.apply_theme(self.theme_color)
        
        GLib.idle_add(self.load_history_metadata)
        GLib.idle_add(lambda: self.run_task(self.init_server()))

    def on_search_changed(self, entry):
        text = entry.get_text().lower()
        
        for i, row in enumerate(self.history_list):
            session_id = self.sessions_metadata[i]["id"]
            path = os.path.join(self.history_dir, f"{session_id}.json")
            
            # Row(ListBoxRow) -> Box(main_box) -> Box(txt_box)
            main_box = row.get_child()
            txt_box = main_box.get_first_child()
            # Title is first, model subtitle is second in txt_box
            title_label = txt_box.get_first_child()
            model_label = title_label.get_next_sibling()
            
            if not text:
                row.set_visible(True)
                model_label.set_label(self.sessions_metadata[i]["model"])
                continue
                
            found_text = None
            try:
                with open(path, 'r') as f:
                    data = json.load(f)
                    for msg in data.get("messages", []):
                        content = msg.get("content", "")
                        if text in content.lower():
                            # Extract preview: start from match and take 40 chars, no leading '...'
                            start_idx = content.lower().find(text)
                            preview = content[start_idx:start_idx+40]
                            found_text = f"{preview}..."
                            break
            except:
                pass
            
            if found_text:
                row.set_visible(True)
                model_label.set_label(found_text)
            else:
                row.set_visible(False)

    def on_attach_clicked(self, btn):
        dialog = Gtk.FileChooserNative.new("Select Image", self.win, Gtk.FileChooserAction.OPEN, "Open", "Cancel")
        filter = Gtk.FileFilter()
        filter.set_name("Images")
        filter.add_mime_type("image/png")
        filter.add_mime_type("image/jpeg")
        filter.add_mime_type("image/webp")
        dialog.add_filter(filter)
        dialog.connect("response", self.on_file_selected)
        dialog.show()

    def on_file_selected(self, dialog, response):
        if response == Gtk.ResponseType.ACCEPT:
            file = dialog.get_file()
            path = file.get_path()
            if path:
                self.selected_image_path = path
                self.update_thumbnail()
        dialog.destroy()

    def update_thumbnail(self):
        child = self.thumb_box.get_first_child()
        while child:
            self.thumb_box.remove(child)
            child = self.thumb_box.get_first_child()

        if self.selected_image_path:
            img = Gtk.Image.new_from_file(self.selected_image_path)
            img.set_pixel_size(100)
            img.set_hexpand(True)
            self.thumb_box.append(img)
            btn = Gtk.Button(icon_name="window-close-symbolic")
            btn.connect("clicked", self.on_remove_thumbnail)
            self.thumb_box.append(btn)

    def on_remove_thumbnail(self, btn):
        self.selected_image_path = None
        self.update_thumbnail()

    def on_allow_switch_toggled(self, action, value):
        new_state = not action.get_state().get_boolean()
        
        if new_state:
            dialog = Adw.MessageDialog(
                transient_for=self.win,
                heading="Enable Model Switching?",
                body="Enabling model switching allows you to change the active model at any time, which may reload the model server. Continue?"
            )
            dialog.add_response("cancel", "Cancel")
            dialog.add_response("enable", "Enable")
            dialog.set_response_appearance("enable", Adw.ResponseAppearance.SUGGESTED)
            dialog.connect("response", lambda d, r: self.complete_switch_toggle(action, r))
            dialog.present()
        else:
            self.complete_switch_toggle(action, "enable")

    def complete_switch_toggle(self, action, response):
        if response == "enable":
            new_state = not action.get_state().get_boolean()
            action.set_state(GLib.Variant.new_boolean(new_state))
            self.allow_mid_chat_switch = new_state
            self.update_model_ui()

    def run_task(self, coro):
        task = asyncio.create_task(coro)
        self.tasks.add(task)
        task.add_done_callback(self.tasks.discard)

    async def init_server(self):
        self.models = flm.get_all_models()
        self.update_model_ui()

    def is_current_model_capable(self) -> bool:
        return self.is_current_model_vlm()

    def is_current_model_vlm(self) -> bool:
        if not self.current_model: return False
        model_data = next((m for m in self.models if m["model"] == self.current_model), None)
        return model_data is not None and model_data.get("vlm", False)

    def update_model_ui(self):
        if not self.models:
            self.models = flm.get_all_models()
        
        # Check if any model is installed
        any_installed = any(m.get('installed', False) for m in self.models)
        
        if self.current_model:
            label_text = self.current_model
            model_data = next((m for m in self.models if m['model'] == self.current_model), None)
            if model_data and model_data.get('vlm', False):
                label_text = "👁 " + label_text
            self.model_btn.set_label(label_text)
        else:
            self.model_btn.set_label("Select a model to start")
        
        # Update buttons
        any_installed = any(m.get('installed', False) for m in self.models)
        if not any_installed:
            self.btn_new.set_sensitive(False)
            self.btn_new.set_tooltip_text("Install a model to start a new chat.")
        else:
            self.btn_new.set_sensitive(True)
            self.btn_new.set_tooltip_text("New Chat")

        is_running = flm.is_model_in_memory(self.server_process)
        ram_ok = flm.has_sufficient_ram()
        
        self.btn_attach.set_sensitive(self.is_current_model_capable())
        
        # Disable entry until a chat is started
        self.entry.set_sensitive(self.current_session_id is not None)
        self.btn_send.set_sensitive(self.current_session_id is not None)
        
        # Disable model selection on welcome screen (no active session)
        if self.current_session_id is None:
            self.model_btn.set_sensitive(False)
            self.model_btn.set_tooltip_text("Start a new chat to select a model.")
        elif not self.allow_mid_chat_switch and self.history:
            self.model_btn.set_sensitive(False)
            self.model_btn.set_tooltip_text("Model locked in memory during active conversation.")
        elif not ram_ok and not is_running:
            self.model_btn.set_sensitive(False)
            self.model_btn.set_tooltip_text("System RAM is critically low. Free memory to load models.")
        else:
            self.model_btn.set_sensitive(True)
            self.model_btn.set_tooltip_text("Select Model")


        popover = Gtk.Popover()
        scrolled = Gtk.ScrolledWindow()
        scrolled.set_min_content_height(350)
        scrolled.set_min_content_width(300)
        
        listbox = Gtk.ListBox()
        listbox.set_selection_mode(Gtk.SelectionMode.NONE)
        
        for m in self.models:
            model_name = m['model']
            is_installed = m.get('installed', False)
            is_downloading = model_name in self.downloading_models
            
            row = Gtk.ListBoxRow()
            box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            box.set_margin_start(10)
            box.set_margin_end(10)
            box.set_margin_top(5)
            box.set_margin_bottom(5)

            label_text = f"⬇ Downloading {model_name}..." if is_downloading else model_name
            if m.get('vlm', False):
                label_text = "👁 " + label_text
            label = Gtk.Label(label=label_text)
            label.set_xalign(0)
             
            if is_downloading:
                row.set_sensitive(False)
            elif not is_installed:
                label.add_css_class("uninstalled-model-label")
            else:
                label.add_css_class("installed-model-label")
             
            box.append(label)
            row.set_child(box)
            listbox.append(row)
            
        listbox.connect("row-activated", self.on_row_activated, popover)
        
        scrolled.set_child(listbox)
        popover.set_child(scrolled)
        self.model_btn.set_popover(popover)

    def on_row_activated(self, listbox, row, popover):
        index = row.get_index()
        if index < len(self.models):
            self.on_model_selected(None, self.models[index], popover)

    def on_model_selected(self, btn, model_data, popover):
        model_name = model_data['model']
        is_installed = model_data.get('installed', False)
        popover.popdown()

        if not is_installed:
            self.confirm_download(model_data)
            return

        self.current_model = model_name
        self.model_btn.set_label(model_name)
        
        if self.history:
            self.save_session()
        
        self.add_system_message(f"Starting process matrix for {model_name}...")
        self.server_process = flm.start_flm_serve(model_name, self.server_process)
        self.run_task(self.wait_for_server())

    async def wait_for_server(self):
        for _ in range(25):
            await asyncio.sleep(1)
            if flm.is_model_in_memory(self.server_process):
                self.add_system_message("Model active in host process space.")
                GLib.timeout_add_seconds(2, self.clear_status_labels)
                return
        self.add_system_message("Error: Runtime server failed to build on subsystem architecture.")

    def confirm_download(self, model_data):
        model_name = model_data['model']
        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Download Model?",
            body=f"Do you want to download {model_name}?"
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("download", "Download")
        dialog.set_response_appearance("download", Adw.ResponseAppearance.SUGGESTED)
        
        dialog.connect("response", self.on_download_response, model_name)
        dialog.present()

    def on_download_response(self, dialog, response, model_name):
        if response == "download":
            self.add_system_message(f"Starting download: {model_name}")
            self.run_task(self.download_model(model_name))

    async def download_model(self, model_name):
        self.downloading_models.add(model_name)
        
        # Add progress bar to the chat box
        progress = Gtk.ProgressBar()
        progress.set_fraction(0.0)
        progress.set_show_text(True)
        progress.set_margin_top(10)
        progress.set_margin_bottom(10)
        # Apply accent color to progress bar via CSS
        progress.add_css_class("suggested-action")
        
        self.chat_box.append(progress)
        self.update_model_ui()
        
        try:
            process = await asyncio.create_subprocess_exec(
                "flm", "pull", model_name,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT
            )
            
            # Simulate progress for now since flm pull might not provide easy chunks
            # A more robust way would be parsing the stdout
            for i in range(1, 101):
                await asyncio.sleep(0.1)
                progress.set_fraction(i / 100.0)
                progress.set_text(f"Downloading {model_name}: {i}%")
            
            await process.wait()
            if process.returncode == 0:
                self.add_system_message(f"Successfully downloaded {model_name}")
            else:
                self.add_system_message(f"Failed to download {model_name}")
        except Exception as e:
            self.add_system_message(f"Download error: {str(e)}")
        finally:
            self.chat_box.remove(progress)
            self.downloading_models.discard(model_name)
            self.models = flm.get_all_models()
            self.update_model_ui()

    def add_message(self, text: str, is_user: bool, image_path: Optional[str] = None):
        bubble_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        bubble_box.add_css_class("user-bubble" if is_user else "assistant-bubble")
        
        if image_path:
            img = Gtk.Image.new_from_file(image_path)
            img.set_pixel_size(200)
            bubble_box.append(img)
            
        bubble = Gtk.Label()
        bubble.set_wrap(True)
        bubble.set_selectable(True)
        bubble.set_xalign(0)
        bubble.set_use_markup(True)
        
        if is_user:
            bubble.set_text(text)
        else:
            bubble.set_markup(utils.markdown_to_pango(text))
        
        bubble_box.append(bubble)
        
        align = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        if is_user:
            align.append(Gtk.Box(hexpand=True))
            align.append(bubble_box)
        else:
            align.append(bubble_box)
            align.append(Gtk.Box(hexpand=True))
            
        self.chat_box.append(align)
        GLib.idle_add(self.scroll_to_bottom)
        return bubble

    def add_system_message(self, text: str):
        label = Gtk.Label(label=text)
        label.add_css_class("dim-label")
        label.set_margin_top(10)
        label.set_margin_bottom(10)
        self.chat_box.append(label)
        self.status_labels.append(label)
        GLib.idle_add(self.scroll_to_bottom)

    def clear_status_labels(self):
        for label in self.status_labels:
            if label.get_parent() == self.chat_box:
                self.chat_box.remove(label)
        self.status_labels = []
        return False

    def scroll_to_bottom(self):
        adj = self.scrolled.get_vadjustment()
        adj.set_value(adj.get_upper() - adj.get_page_size())

    def load_history_metadata(self):
        self.sessions_metadata = []
        try:
            if not os.path.exists(self.history_dir):
                return
            files = [f for f in os.listdir(self.history_dir) if f.endswith(".json")]
            files.sort(reverse=True)
            for f in files:
                path = os.path.join(self.history_dir, f)
                with open(path, 'r') as jf:
                    data = json.load(jf)
                    self.sessions_metadata.append({
                        "id": data.get("id", f.replace(".json", "")),
                        "title": data.get("title", "Untitled Chat"),
                        "model": data.get("model", "unknown")
                    })
        except Exception as e:
            print(f"Error loading history: {e}")
        self.update_history_ui()

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
            title.set_max_width_chars(20)
            title.add_css_class("sidebar-title")
            
            model_label = meta["model"]
            model_data = next((m for m in self.models if m['model'] == meta["model"]), None)
            if model_data and model_data.get('vlm', False):
                model_label = "👁 " + model_label
            
            model = Gtk.Label(label=model_label)
            model.set_halign(Gtk.Align.START)
            model.add_css_class("sidebar-subtitle")
            
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

    def on_delete_clicked(self, btn, session_id):
        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Delete Chat?",
            body="Are you sure you want to permanently delete this conversation?"
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("delete", "Delete")
        dialog.set_response_appearance("delete", Adw.ResponseAppearance.DESTRUCTIVE)
         
        dialog.connect("response", self.on_delete_response, session_id)
        dialog.present()

    def on_delete_response(self, dialog, response, session_id):
        if response == "delete":
            path = os.path.join(self.history_dir, f"{session_id}.json")
            if os.path.exists(path):
                os.remove(path)
            
            self.sessions_metadata = [m for m in self.sessions_metadata if m["id"] != session_id]
            
            if self.current_session_id == session_id:
                self.entry.get_buffer().set_text("")
                self.chat_box_remove_all()
                self.history = []
                self.current_session_id = None
                self.update_model_ui()
                self.add_system_message("Session deleted.")
            
            self.update_history_ui()
        dialog.destroy()

    def on_clear_history(self, action, value):
        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Clear All History?",
            body="This will permanently delete all saved chat sessions. Continue?"
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("clear", "Clear All")
        dialog.set_response_appearance("clear", Adw.ResponseAppearance.DESTRUCTIVE)
        
        dialog.connect("response", self.on_clear_history_response)
        dialog.present()

    def on_clear_history_response(self, dialog, response):
        if response == "clear":
            try:
                for f in os.listdir(self.history_dir):
                    if f.endswith(".json"):
                        os.remove(os.path.join(self.history_dir, f))
                self.sessions_metadata = []
                self.entry.get_buffer().set_text("")
                self.chat_box_remove_all()
                self.history = []
                self.current_session_id = None
                self.update_model_ui()
                self.add_system_message("History cleared.")
                self.update_history_ui()
            except Exception as e:
                self.add_system_message(f"Error clearing history: {e}")
        dialog.destroy()

    def on_history_row_activated(self, listbox, row):
        index = row.get_index()
        if index < len(self.sessions_metadata):
            session_id = self.sessions_metadata[index]["id"]
            
            if self.current_session_id == session_id:
                return
            
            if flm.is_model_in_memory(self.server_process) or self.server_process or self.current_model:
                dialog = Adw.MessageDialog(
                    transient_for=self.win,
                    heading="Switch Chat?",
                    body="Switching chats will unload the current model and clear the current chat session. Continue?"
                )
                dialog.add_response("cancel", "Cancel")
                dialog.add_response("switch", "Switch")
                dialog.set_response_appearance("switch", Adw.ResponseAppearance.DESTRUCTIVE)
                dialog.connect("response", self.on_switch_dialog_response, session_id)
                dialog.present()
            else:
                self.run_task(self.load_session(session_id))

    def on_switch_dialog_response(self, dialog, response, session_id):
        if response == "switch":
            if self.ai_task and not self.ai_task.done():
                self.ai_task.cancel()
            
            self.execute_eject()
            self.run_task(self.load_session(session_id))
        dialog.destroy()

    def save_session(self):
        if not self.history:
            return
            
        if not self.current_session_id:
            import time
            self.current_session_id = str(int(time.time()))
        
        title = "Untitled Chat"
        for msg in self.history:
            if msg["role"] == "user":
                title = msg["content"][:40].replace("\n", " ") + (len(msg["content"]) > 40 and "..." or "")
                break
        
        data = {
            "id": self.current_session_id,
            "title": title,
            "model": self.current_model or "none",
            "messages": self.history
        }
        
        path = os.path.join(self.history_dir, f"{self.current_session_id}.json")
        try:
            with open(path, 'w') as f:
                json.dump(data, f)
            
            meta = next((m for m in self.sessions_metadata if m["id"] == self.current_session_id), None)
            if meta:
                if meta["title"] != title or meta["model"] != data["model"]:
                    meta["title"] = title
                    meta["model"] = data["model"]
                    self.update_history_ui()
            else:
                self.sessions_metadata.insert(0, {"id": data["id"], "title": data["title"], "model": data["model"]})
                self.update_history_ui()
        except Exception as e:
            print(f"Error saving session: {e}")

    async def load_session(self, session_id):
        path = os.path.join(self.history_dir, f"{session_id}.json")
        try:
            with open(path, 'r') as f:
                data = json.load(f)
                self.current_session_id = session_id
                self.history = data.get("messages", [])
                self.current_model = data.get("model")
                
                self.chat_box_remove_all()
                
                for msg in self.history:
                    self.add_message(msg.get("content", ""), msg["role"] == "user", msg.get("image"))
                
                if self.current_model and self.current_model != "none":
                    self.model_btn.set_label(self.current_model)
                    self.add_system_message("Resources clearing... please wait.")
                    await asyncio.sleep(1.5)
                    self.server_process = flm.start_flm_serve(self.current_model, self.server_process)
                    self.run_task(self.wait_for_server())
                
                self.update_model_ui()
        except Exception as e:
            self.add_system_message(f"Error loading session: {e}")

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
        self.chat_box_remove_all()
        # Disable model selection on welcome screen
        self.model_btn.set_sensitive(False)
        self.model_btn.set_tooltip_text("Start a new chat to select a model.")
        
        # Disable interaction
        self.entry.set_sensitive(False)
        self.btn_send.set_sensitive(False)

        welcome_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=20)
        welcome_box.set_valign(Gtk.Align.CENTER)
        welcome_box.set_halign(Gtk.Align.CENTER)
        
        icon = Gtk.Image(icon_name="document-new-symbolic")
        icon.set_pixel_size(64)
        icon.set_halign(Gtk.Align.CENTER)
        welcome_box.append(icon)
        
        info_text = (
            "Welcome to FastFlowLM-gtk!\n\n"
            "This app is a graphical interface for the FastFlowLM engine.\n\n"
            "• Modern, distraction-free desktop UI\n"
            "• Advanced session & history management\n"
            "• Search history with live message previews\n"
            "• Markdown bolding & visual formatting support\n"
            "• Image attachment support (for vision models)\n"
            "• Customizable theme colors\n\n"
            "Please click 'New Chat' to begin."
        )
        
        label = Gtk.Label(label=info_text)
        label.set_justify(Gtk.Justification.LEFT)
        label.set_halign(Gtk.Align.CENTER)
        welcome_box.append(label)
        
        link = Gtk.LinkButton(uri="https://github.com/FastFlowLM/FastFlowLM", label="Visit FastFlowLM on GitHub")
        link.set_halign(Gtk.Align.CENTER)
        welcome_box.append(link)
        
        # Center the box inside the chat area
        outer_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        outer_box.set_valign(Gtk.Align.CENTER)
        outer_box.append(welcome_box)
        
        self.chat_box.append(outer_box)

    def execute_new_chat(self):
        self.save_session()
        self.entry.get_buffer().set_text("")
        self.chat_box_remove_all()
        self.history = []
        self.current_session_id = str(int(time.time()))
        # Re-enable model selection
        self.model_btn.set_sensitive(True)
        self.update_model_ui()
        self.add_system_message("New session started.")

    def execute_eject(self):
        self.current_model = None
        self.update_model_ui()

    def on_key_pressed(self, ctrl, keyval, keycode, state):
        if keyval == Gdk.KEY_Return:
            if not (state & Gdk.ModifierType.SHIFT_MASK):
                self.on_send(None)
                return True
        return False

    def chat_box_remove_all(self):
        child = self.chat_box.get_first_child()
        while child:
            self.chat_box.remove(child)
            child = self.chat_box.get_first_child()

    def on_send(self, widget):
        buffer = self.entry.get_buffer()
        start, end = buffer.get_bounds()
        text = buffer.get_text(start, end, True).strip()
        
        if not text and not self.selected_image_path:
            return
            
        if self.ai_task and not self.ai_task.done():
            self.ai_task.cancel()
            
        buffer.set_text("")
        self.add_message(text, is_user=True, image_path=self.selected_image_path)
        self.history.append({"role": "user", "content": text, "image": self.selected_image_path})
        
        self.selected_image_path = None
        self.update_thumbnail()
        
        self.save_session()
        self.update_model_ui()
        self.ai_task = asyncio.create_task(self.get_ai_response())
        self.tasks.add(self.ai_task)
        
        GLib.idle_add(self.scroll_to_bottom)

    async def get_ai_response(self):
        if not self.current_model:
            self.add_system_message("Please select a model first.")
            return

        thinking_label = Gtk.Label(label="Thinking...")
        thinking_label.add_css_class("dim-label")
        self.chat_box.append(thinking_label)
        
        bubble = self.add_message("", is_user=False)
        full_content = ""
        
        messages = []
        for msg in self.history:
            content = [{"type": "text", "text": msg.get("content", "")}]
            if msg.get("image"):
                try:
                    import base64
                    with open(msg["image"], "rb") as image_file:
                        encoded = base64.b64encode(image_file.read()).decode('utf-8')
                        content.append({"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{encoded}"}})
                except Exception as e:
                    print(f"Error encoding image: {e}")
            messages.append({"role": msg["role"], "content": content})

        payload = {
            "model": self.current_model,
            "messages": messages,
            "stream": True
        }
        
        msg = Soup.Message.new("POST", f"{BASE_URL}/chat/completions")
        msg.set_request_body_from_bytes("application/json", GLib.Bytes.new(json.dumps(payload).encode()))
        
        try:
            stream = await self.session.send_async(msg, GLib.PRIORITY_DEFAULT, None)
            if not stream:
                self.add_system_message("Error: Network endpoint request failed.")
                self.chat_box.remove(thinking_label)
                return
                
            data_stream = Gio.DataInputStream.new(stream)
            while True:
                line_bytes, length = await data_stream.read_line_async(GLib.PRIORITY_DEFAULT, None)
                if line_bytes is None: break
                
                line = line_bytes.decode('utf-8').strip()
                if not line or not line.startswith("data: "): continue
                
                content = line[6:]
                if content == "[DONE]": break
                
                try:
                    chunk = json.loads(content)
                    if 'choices' in chunk and len(chunk['choices']) > 0:
                        text = chunk['choices'][0].get('delta', {}).get('content')
                        if text:
                            if thinking_label.get_parent() == self.chat_box:
                                self.chat_box.remove(thinking_label)
                            full_content += text
                            bubble.set_markup(utils.markdown_to_pango(full_content))
                    self.scroll_to_bottom()
                except Exception as e:
                    print(f"Error parsing chunk: {e}")
            
            if thinking_label.get_parent() == self.chat_box:
                self.chat_box.remove(thinking_label)
            
            self.history.append({"role": "assistant", "content": full_content})
            self.save_session()
        except asyncio.CancelledError:
            if thinking_label.get_parent() == self.chat_box:
                self.chat_box.remove(thinking_label)
            raise
        except Exception as e:
            if thinking_label.get_parent() == self.chat_box:
                self.chat_box.remove(thinking_label)
            self.add_system_message(f"Connection mapping error: {str(e)}")

    def on_choose_color(self, action, value):
        dialog = Gtk.ColorDialog.new()
        dialog.choose_rgba(self.win, None, None, self.on_color_picked, None)

    def load_theme_color(self):
        config_path = os.path.expanduser("~/.config/flm/theme.json")
        if os.path.exists(config_path):
            try:
                with open(config_path, "r") as f:
                    return json.load(f).get("accent_color", "#3584e4")
            except: pass
        return "#3584e4"

    def apply_theme(self, hex_color):
        full_css = f"""
        @define-color accent_bg_color {hex_color};
        .user-bubble {{ background-color: {hex_color}; }}
        .sidebar-title {{ color: #ffffff; }}
        .sidebar-subtitle {{ color: #ffffff; }}
        row:selected {{ background-color: {hex_color}; }}
        button.suggested-action {{ background-color: {hex_color}; }}
        {utils.CSS}
        """
        self.css_provider.load_from_data(full_css.encode())

    def on_color_picked(self, dialog, result, data):
        try:
            color = dialog.choose_rgba_finish(result)
            hex_color = "#{:02x}{:02x}{:02x}".format(int(color.red * 255), int(color.green * 255), int(color.blue * 255))
            self.apply_theme(hex_color)
            
            config_path = os.path.expanduser("~/.config/flm/theme.json")
            with open(config_path, "w") as f:
                json.dump({"accent_color": hex_color}, f)
        except Exception as e:
            print(f"Error applying color: {e}")

    def do_shutdown(self):
        self.save_session()
        if self.server_process:
            self.server_process.terminate()
        Adw.Application.do_shutdown(self)
