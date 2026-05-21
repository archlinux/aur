import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Gdk", "4.0")
from gi.repository import Gtk, Gdk, GLib, Adw
import asyncio
import display
import os
import flm
from typing import Optional

def on_key_pressed(app, ctrl: Gtk.EventControllerKey, keyval: int, keycode: int, state: Gdk.ModifierType) -> bool:
    """Handles Enter key press to send messages (unless SHIFT is held)."""
    if keyval == Gdk.KEY_Return:
        if not (state & Gdk.ModifierType.SHIFT_MASK):
            on_send(app, None)
            return True
    return False

def on_send(app, widget: Optional[Gtk.Widget]) -> None:
    """Handles the send action triggered by the button or Enter key."""
    if app.is_sending:
        return
        
    buffer = app.entry.get_buffer()
    start, end = buffer.get_bounds()
    text = buffer.get_text(start, end, True).strip()
    
    if not text and not app.selected_image_path:
        return
    
    # Initialize session ID on first message if not already set
    if not app.current_session_id:
        app.current_session_id = str(int(time.time()))
        
    app.is_sending = True
    
    # Immediate UI lock
    app.input_box.set_sensitive(False)
    app.entry.set_editable(False)
        
    buffer.set_text("")
    display.add_message(app, text, is_user=True, image_path=app.selected_image_path)
    app.history.append({"role": "user", "content": text, "image": app.selected_image_path})
    
    app.selected_image_path = None
    app.update_thumbnail()
    
    app.save_session()
    app.update_model_ui()
    app.ai_task = asyncio.create_task(app.get_ai_response())
    app.tasks.add(app.ai_task)
    
    GLib.idle_add(lambda: display.scroll_to_bottom(app))

def on_attach_clicked(app, btn):
    app.btn_attach.set_sensitive(False)
    dialog = Gtk.FileChooserNative.new("Select Image", app.win, Gtk.FileChooserAction.OPEN, "Open", "Cancel")
    filter = Gtk.FileFilter()
    filter.set_name("Images")
    filter.add_mime_type("image/png")
    filter.add_mime_type("image/jpeg")
    filter.add_mime_type("image/webp")
    dialog.add_filter(filter)
    dialog.connect("response", lambda d, r: on_file_selected(app, d, r))
    dialog.show()

def on_file_selected(app, dialog, response):
    app.btn_attach.set_sensitive(app.is_current_model_capable())
    if response == Gtk.ResponseType.ACCEPT:
        file = dialog.get_file()
        path = file.get_path()
        if path:
            app.selected_image_path = path
            app.update_thumbnail()
    dialog.destroy()

def on_allow_switch_toggled(app, action, value):
    new_state = not action.get_state().get_boolean()
    
    if new_state:
        dialog = Adw.MessageDialog(
            transient_for=app.win,
            heading="Enable Model Switching?",
            body="Enabling model switching allows you to change the active model at any time, which may reload the model server. Continue?"
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("enable", "Enable")
        dialog.set_response_appearance("enable", Adw.ResponseAppearance.SUGGESTED)
        dialog.connect("response", lambda d, r: complete_switch_toggle(app, action, r))
        dialog.present()
    else:
        complete_switch_toggle(app, action, "enable")

def complete_switch_toggle(app, action, response):
    if response == "enable":
        new_state = not action.get_state().get_boolean()
        action.set_state(GLib.Variant.new_boolean(new_state))
        app.allow_mid_chat_switch = new_state
        app.update_model_ui()

def on_history_row_activated(app, listbox, row):
    index = row.get_index()
    if index < len(app.sessions_metadata):
        session_id = app.sessions_metadata[index]["id"]
        
        if app.current_session_id == session_id:
            return
        
        if flm.is_model_in_memory(app.server_process) or app.server_process or app.current_model:
            dialog = Adw.MessageDialog(
                transient_for=app.win,
                heading="Switch Chat?",
                body="Switching chats will unload the current model and clear the current chat session. Continue?"
            )
            dialog.add_response("cancel", "Cancel")
            dialog.add_response("switch", "Switch")
            dialog.set_response_appearance("switch", Adw.ResponseAppearance.DESTRUCTIVE)
            dialog.connect("response", lambda d, r: on_switch_dialog_response(app, d, r, session_id))
            dialog.present()
        else:
            app.run_task(app.load_session(session_id))

def on_switch_dialog_response(app, dialog, response, session_id):
    if response == "switch":
        display.cancel_ai_task(app)
        app.execute_eject()
        app.run_task(app.load_session(session_id))
    dialog.destroy()

def on_delete_clicked(app, btn, session_id):
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Delete Chat?",
        body="Are you sure you want to permanently delete this conversation?"
    )
    dialog.add_response("cancel", "Cancel")
    dialog.add_response("delete", "Delete")
    dialog.set_response_appearance("delete", Adw.ResponseAppearance.DESTRUCTIVE)
        
    dialog.connect("response", lambda d, r: on_delete_response(app, d, r, session_id))
    dialog.present()

def on_delete_response(app, dialog, response, session_id):
    if response == "delete":
        path = os.path.join(app.history_dir, f"{session_id}.json")
        if os.path.exists(path):
            os.remove(path)
        
        app.sessions_metadata = [m for m in app.sessions_metadata if m["id"] != session_id]
        
        if app.current_session_id == session_id:
            app.current_session_id = None
            app.history = []
            app.update_model_ui()
            app.show_welcome_message()
            display.add_system_message(app, "Session deleted.")
        
        app.update_history_ui()
    dialog.destroy()

def on_clear_history(app, action, value):
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Clear All History?",
        body="This will permanently delete all saved chat sessions. Continue?"
    )
    dialog.add_response("cancel", "Cancel")
    dialog.add_response("clear", "Clear All")
    dialog.set_response_appearance("clear", Adw.ResponseAppearance.DESTRUCTIVE)
    
    dialog.connect("response", lambda d, r: on_clear_history_response(app, d, r))
    dialog.present()

def on_clear_history_response(app, dialog, response):
    if response == "clear":
        try:
            for f in os.listdir(app.history_dir):
                if f.endswith(".json"):
                    os.remove(os.path.join(app.history_dir, f))
            app.sessions_metadata = []
            app.current_session_id = None
            app.history = []
            app.update_model_ui()
            app.show_welcome_message()
            display.add_system_message(app, "History cleared.")
            app.update_history_ui()
        except Exception as e:
            display.add_system_message(app, f"Error clearing history: {e}")
    dialog.destroy()
