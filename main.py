import asyncio
import json
import subprocess
import os
import fcntl
import time
import logging
import base64
from typing import Optional, List, Dict

import init_gi
import gi
from gi.repository import Gtk, Gdk, GdkPixbuf, Gio, GLib, Adw, Soup

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

        self.downloading_models = set()
        self.tasks = set()
        self.session = Soup.Session()
        self.history = []
        self.status_labels = []
        self.selected_attachments: List[dict] = []
        
        self.history_dir = os.path.expanduser("~/.config/flm/history")
        os.makedirs(self.history_dir, exist_ok=True)
        self.current_session_id = None
        self.sessions_metadata = []
        self.allow_mid_chat_switch = False
        self.is_sending = False
        self.is_welcome_screen = True
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

        # Setup native keyboard actions & accelerators
        self.action_new_chat = Gio.SimpleAction.new("new_chat", None)
        self.action_new_chat.connect("activate", lambda a, p: self.on_new_chat(None))
        self.add_action(self.action_new_chat)
        self.set_accels_for_action("app.new_chat", ["<Ctrl>n"])

        self.action_search_chats = Gio.SimpleAction.new("search_chats", None)
        self.action_search_chats.connect("activate", self.on_search_chats_activated)
        self.add_action(self.action_search_chats)
        self.set_accels_for_action("app.search_chats", ["<Ctrl>f"])

        self.action_copy_last = Gio.SimpleAction.new("copy_last", None)
        self.action_copy_last.connect("activate", self.on_copy_last_activated)
        self.add_action(self.action_copy_last)
        self.set_accels_for_action("app.copy_last", ["<Ctrl><Shift>c"])

        self.action_toggle_sidebar = Gio.SimpleAction.new("toggle_sidebar", None)
        self.action_toggle_sidebar.connect("activate", lambda a, p: self.btn_sidebar.set_active(not self.btn_sidebar.get_active()))
        self.add_action(self.action_toggle_sidebar)
        self.set_accels_for_action("app.toggle_sidebar", ["F9"])

        self.action_show_shortcuts = Gio.SimpleAction.new("show_shortcuts", None)
        self.action_show_shortcuts.connect("activate", self.on_show_shortcuts_activated)
        self.add_action(self.action_show_shortcuts)
        self.set_accels_for_action("app.show_shortcuts", ["<Ctrl>question", "<Ctrl>slash"])

        # Initial shortcuts sensitivity update
        self.update_shortcuts_sensitivity()
        
        self.css_provider.load_from_data(utils.CSS.encode())
        theme.apply_theme(self, self.theme_color)
        # Apply globally to ensure dialogs pick it up
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
        menu.append("Keyboard Shortcuts", "app.show_shortcuts")
        self.options_btn.set_menu_model(menu)

        self.update_model_ui()
        self.show_welcome_message()

        self.win.present()
        
        theme.apply_theme(self, self.theme_color)
        
        GLib.idle_add(lambda: sessions.load_history_metadata(self))
        GLib.idle_add(lambda: self.run_task(self.init_server()))

    def on_search_changed(self, entry):
        import re
        text = entry.get_text().lower().strip()
        
        # Build search cache if not present or needs refresh (preserves original casing)
        if not hasattr(self, '_search_cache'):
            self._search_cache = {}
            for meta in self.sessions_metadata:
                session_id = meta["id"]
                path = os.path.join(self.history_dir, f"{session_id}.json")
                try:
                    with open(path, 'r') as f:
                        data = json.load(f)
                        full_text = " ".join([msg.get("content", "") for msg in data.get("messages", [])])
                        self._search_cache[session_id] = full_text
                except Exception as e:
                    logging.error(f"Failed to cache session {session_id}: {e}")
                    self._search_cache[session_id] = ""
        
        # Helper to escape HTML tags in text for safe Pango markup
        def escape_pango(t: str) -> str:
            return t.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
            
        # Helper to highlight occurrences of the query using bold tags case-insensitively
        def highlight_match(t: str, query: str) -> str:
            escaped_t = escape_pango(t)
            if not query:
                return escaped_t
            escaped_query = escape_pango(query)
            try:
                pattern = re.compile(re.escape(escaped_query), re.IGNORECASE)
                return pattern.sub(lambda m: f"<b>{m.group(0)}</b>", escaped_t)
            except Exception:
                return escaped_t
        
        for row in self.history_list:
            session_id = getattr(row, 'session_id', None)
            meta = getattr(row, 'session_meta', None)
            if not session_id or not meta:
                continue
                
            original_content = self._search_cache.get(session_id, "")
            content_lower = original_content.lower()
            title_text = meta.get("title", "")
            model_text = meta.get("model", "")
            
            # Find labels inside the list row layout
            main_box = row.get_child()
            txt_box = main_box.get_first_child()
            title_label = txt_box.get_first_child()
            model_label = title_label.get_next_sibling()
            
            # Make sure labels support markup
            title_label.set_use_markup(True)
            model_label.set_use_markup(True)
            
            # Determine base model label prefixing for VLM indicator
            model_display_text = model_text
            model_data = next((m for m in self.models if m['model'] == model_text), None)
            if model_data and model_data.get('vlm', False):
                model_display_text = "👁 " + model_display_text
                
            if not text:
                row.set_visible(True)
                title_label.set_markup(escape_pango(title_text))
                model_label.set_markup(escape_pango(model_display_text))
                continue
                
            # Perform search check on Title, Model, and Content
            matches_title = text in title_text.lower()
            matches_model = text in model_text.lower()
            matches_content = text in content_lower
            
            if matches_title or matches_model or matches_content:
                row.set_visible(True)
                
                # The model name always stays in the subtitle position, highlighted if matched
                model_label.set_markup(highlight_match(model_display_text, text))
                
                # Show highlighted content snippet inside the Title position if matched, otherwise show standard title
                if matches_content:
                    start_idx = content_lower.find(text)
                    # Start preview EXACTLY at the matching text, going forward 50 characters
                    slice_end = min(len(original_content), start_idx + 50)
                    preview_slice = original_content[start_idx:slice_end]
                    
                    # Clean and sanitize whitespace/newlines
                    preview_clean = " ".join(preview_slice.replace("\n", " ").replace("\r", " ").replace("\t", " ").split())
                    
                    suffix = "..." if slice_end < len(original_content) else ""
                    preview_formatted = f"{preview_clean}{suffix}"
                    
                    title_label.set_markup(highlight_match(preview_formatted, text))
                else:
                    title_label.set_markup(highlight_match(title_text, text))
            else:
                row.set_visible(False)

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
        return self.current_model is not None

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
        # Clear search cache when UI updates to prevent indexing out of sync
        if hasattr(self, '_search_cache'):
            del self._search_cache
            
        child = self.history_list.get_first_child()
        while child:
            next_child = child.get_next_sibling()
            self.history_list.remove(child)
            child = next_child
        
        for meta in self.sessions_metadata:
            row = Gtk.ListBoxRow()
            # Store session_id and metadata directly on row to guarantee search safety
            row.session_id = meta["id"]
            row.session_meta = meta
            
            main_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
            main_box.set_margin_start(10)
            main_box.set_margin_end(5)
            main_box.set_margin_top(10)
            main_box.set_margin_bottom(10)
            
            txt_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
            txt_box.set_hexpand(True)
            
            title = Gtk.Label()
            title.set_use_markup(True)
            title.set_markup(meta["title"].replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
            title.set_halign(Gtk.Align.START)
            title.set_ellipsize(3)
            title.set_max_width_chars(24)
            title.add_css_class("sidebar-title")
            
            model_label = meta["model"]
            model_data = next((m for m in self.models if m['model'] == meta["model"]), None)
            if model_data and model_data.get('vlm', False):
                model_label = "👁 " + model_label
            
            model = Gtk.Label()
            model.set_use_markup(True)
            model.set_markup(model_label.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
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
        if hasattr(self, '_search_cache'):
            del self._search_cache

        self.execute_eject()
        self.entry.get_buffer().set_text("")
        display.chat_box_remove_all(self)

        self.history = []
        self.current_session_id = None
        self.is_welcome_screen = False

        self.model_btn.set_sensitive(True)
        models.update_model_ui(self)
        self.set_entry_locked(False)
        self.btn_send.set_sensitive(True)
        self.update_model_ui()
        display.add_system_message(self, "Ready. Select a model and send a message to start.")

    def execute_eject(self):
        if self.server_process:
            self.server_process.terminate()
            self.server_process = None
        self.current_model = None
        self.set_entry_locked(True)
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
        self.history = []
        self.current_session_id = None
        self.current_model = None
        display.chat_box_remove_all(self)

        self.models = flm.get_all_models()
        path = os.path.join(self.history_dir, f"{session_id}.json")
        try:
            with open(path, 'r') as f:
                data = json.load(f)
                self.current_session_id = session_id
                self.history = data.get("messages", [])
                self.current_model = data.get("model")
                
                for msg in self.history:
                    attachments = msg.get("attachments", [])
                    if not attachments and msg.get("image"):
                        attachments = [{"path": msg.get("image"), "type": "image"}]
                    display.add_message(self, msg.get("content", ""), msg["role"] == "user", attachments)
                
                model_data = next((m for m in self.models if m['model'] == self.current_model), None)
                
                if self.current_model and self.current_model != "none":
                    if model_data and model_data.get('installed', False):
                        self.model_btn.set_label(self.current_model)
                        display.add_system_message(self, "Resources clearing... please wait.")
                        await asyncio.sleep(1.5)
                        self.server_process = flm.start_flm_serve(self.current_model, self.server_process)
                        self.run_task(self.wait_for_server())
                    else:
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

    def set_entry_locked(self, locked: bool, message: str = "Please wait..."):
        self.entry.set_sensitive(not locked)
        self.entry.set_editable(not locked)
        
        buffer = self.entry.get_buffer()
        if locked:
            buffer.set_text(message)
            self.entry.set_justification(Gtk.Justification.CENTER)
            self.entry.add_css_class("locked-entry")
        else:
            buffer.set_text("")
            self.entry.set_justification(Gtk.Justification.LEFT)
            self.entry.remove_css_class("locked-entry")

    def unlock_ui(self):
        self.input_box.set_sensitive(True)
        self.set_entry_locked(False)
        self.btn_attach.set_sensitive(self.is_current_model_capable())
        self.entry.grab_focus()
        self.is_sending = False

    async def get_ai_response(self):
        if not self.current_model:
            display.add_system_message(self, "Please select a model first.")
            return

        if not flm.is_server_ready(self.current_model):
            display.add_system_message(self, "Error: Model server is not responding. Try reloading the model.")
            return

        thinking_box = display.add_spinner(self)
        bubble = display.add_message(self, "", is_user=False)
        full_content = ""
        
        try:
            messages = []
            for msg in self.history:
                role = msg["role"]
                text_content = msg.get("content", "")
                if messages and messages[-1]["role"] == role:
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

                images_to_encode = []
                if msg.get("image"):
                    images_to_encode.append(msg["image"])
                if msg.get("attachments"):
                    for att in msg["attachments"]:
                        if isinstance(att, dict) and att.get("type") == "image":
                            path = att.get("path")
                            if path and path not in images_to_encode:
                                images_to_encode.append(path)

                for img_path in images_to_encode:
                    try:
                        pixbuf = GdkPixbuf.Pixbuf.new_from_file(img_path)
                        
                        # Handle transparency by compositing onto white
                        if pixbuf.get_has_alpha():
                            white_pixbuf = GdkPixbuf.Pixbuf.new(GdkPixbuf.Colorspace.RGB, False, 8, pixbuf.get_width(), pixbuf.get_height())
                            white_pixbuf.fill(0xffffffff)
                            pixbuf.composite(white_pixbuf, 0, 0, pixbuf.get_width(), pixbuf.get_height(), 0, 0, 1, 1, GdkPixbuf.InterpType.BILINEAR, 255)
                            pixbuf = white_pixbuf

                        success, buffer = pixbuf.save_to_bufferv("jpeg", ["quality"], ["90"])
                        if success:
                            encoded = base64.b64encode(buffer).decode("utf-8")
                            messages[-1]["content"].append({
                                "type": "image_url", 
                                "image_url": {"url": f"data:image/jpeg;base64,{encoded}"}
                            })
                        else:
                            logging.error(f"Failed to convert image: {img_path}")
                    except Exception as e:
                        logging.error(f"Error encoding image: {e}")

            stream = await network.get_ai_response(self, bubble, thinking_box, messages)
            if not stream:
                display.add_system_message(self, "Error: Connection lost or network endpoint failed.")
                return

            data_stream = Gio.DataInputStream.new(stream)
            while True:
                line_bytes, length = await data_stream.read_line_async(GLib.PRIORITY_DEFAULT, None)
                if line_bytes is None: break
                line = line_bytes.decode("utf-8").strip()
                if not line: continue
                if line.startswith("data: "):
                    content = line[6:]
                    if content == "[DONE]": break
                    try:
                        chunk = json.loads(content)
                        if "choices" in chunk and len(chunk["choices"]) > 0:
                            text = chunk["choices"][0].get("delta", {}).get("content")
                            if text:
                                if thinking_box and thinking_box.get_parent() == self.chat_box:
                                    self.chat_box.remove(thinking_box)
                                full_content += text
                                markup = utils.markdown_to_pango(full_content)
                                GLib.idle_add(bubble.set_markup, markup)
                            display.scroll_to_bottom(self)
                    except json.JSONDecodeError as e:
                        logging.error(f"JSON parsing error: {e}")
            
            parent = bubble.get_parent()
            if parent:
                parent.remove(bubble)
                chunks = utils.parse_message(full_content)
                for ctype, content, lang in chunks:
                    if ctype == "code":
                        parent.append(display.create_code_block(content, lang))
                    else:
                        new_bubble = Gtk.Label()
                        new_bubble.set_wrap(True)
                        new_bubble.set_selectable(True)
                        new_bubble.set_xalign(0)
                        new_bubble.set_use_markup(True)
                        new_bubble.set_markup(utils.markdown_to_pango(content))
                        parent.append(new_bubble)
                
                # Append copy button to the bottom of the assistant message box
                if full_content:
                    copy_btn = Gtk.Button(icon_name="edit-copy-symbolic")
                    copy_btn.add_css_class("flat")
                    copy_btn.add_css_class("dim-label")
                    copy_btn.add_css_class("copy-btn")
                    copy_btn.set_halign(Gtk.Align.END)
                    copy_btn.connect("clicked", lambda b: display.copy_to_clipboard(full_content))
                    parent.append(copy_btn)
            
            self.history.append({"role": "assistant", "content": full_content})
            self.save_session()
        
        except asyncio.CancelledError:
            raise
        except Exception as e:
            logging.error(f"General response error: {str(e)}")
        finally:
            self.is_sending = False
            GLib.idle_add(self.unlock_ui)
            if thinking_box and thinking_box.get_parent() == self.chat_box:
                GLib.idle_add(self.chat_box.remove, thinking_box)
            if not full_content:
                def cleanup_empty_bubble():
                    try:
                        p1 = bubble.get_parent()
                        if p1:
                            p2 = p1.get_parent()
                            if p2 and p2.get_parent() == self.chat_box:
                                self.chat_box.remove(p2)
                    except Exception as e:
                        logging.error(f"Error cleaning up empty bubble: {e}")
                GLib.idle_add(cleanup_empty_bubble)

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

    def on_search_chats_activated(self, action, param):
        if not self.btn_sidebar.get_active():
            self.btn_sidebar.set_active(True)
        self.search_entry.grab_focus()

    def on_copy_last_activated(self, action, param):
        for msg in reversed(self.history):
            if msg.get("role") == "assistant" and msg.get("content"):
                display.copy_to_clipboard(msg["content"])
                return

    def on_show_shortcuts_activated(self, action, param):
        shortcuts_win = Gtk.ShortcutsWindow(transient_for=self.win)
        
        nav_group = Gtk.ShortcutsGroup(title="Navigation")
        nav_group.append(Gtk.ShortcutsShortcut(title="Toggle Sidebar", accelerator="F9"))
        nav_group.append(Gtk.ShortcutsShortcut(title="Search Chats", accelerator="<Ctrl>f"))
        
        chat_group = Gtk.ShortcutsGroup(title="Chat Actions")
        chat_group.append(Gtk.ShortcutsShortcut(title="Start New Chat", accelerator="<Ctrl>n"))
        chat_group.append(Gtk.ShortcutsShortcut(title="Send Message", accelerator="Return"))
        chat_group.append(Gtk.ShortcutsShortcut(title="Insert Newline", accelerator="<Shift>Return"))
        chat_group.append(Gtk.ShortcutsShortcut(title="Copy Last AI Response", accelerator="<Ctrl><Shift>c"))
        
        app_group = Gtk.ShortcutsGroup(title="Application")
        app_group.append(Gtk.ShortcutsShortcut(title="Keyboard Shortcuts Help", accelerator="<Ctrl>question"))
        
        section = Gtk.ShortcutsSection(title="General", section_name="general")
        section.append(nav_group)
        section.append(chat_group)
        section.append(app_group)
        
        shortcuts_win.add_section(section)
        shortcuts_win.present()

    def update_shortcuts_sensitivity(self):
        if not hasattr(self, 'action_new_chat'):
            return
        is_locked = len(self.downloading_models) > 0 or self.is_sending
        has_history = len(self.history) > 0
        
        self.action_new_chat.set_enabled(not is_locked)
        self.action_search_chats.set_enabled(not is_locked)
        self.action_copy_last.set_enabled(not is_locked and has_history)

    def do_shutdown(self):
        self.save_session()
        if self.server_process:
            self.server_process.terminate()
        flm.kill_existing_servers()
        Adw.Application.do_shutdown(self)
