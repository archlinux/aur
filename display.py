"""
Module for chat display management.
Handles UI rendering, message bubble construction, and visual status updates.
"""
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Gdk", "4.0")
from gi.repository import Gtk, Gdk, GLib
import utils
from typing import Optional

def add_message(app, text: str, is_user: bool, image_path: Optional[str] = None) -> Gtk.Label:
    """
    Renders a chat bubble to the main display area with modern styling.
    """
    bubble_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
    bubble_box.add_css_class("user-bubble" if is_user else "assistant-bubble")
    
    if image_path:
        img = Gtk.Image.new_from_file(image_path)
        img.set_pixel_size(240)
        img.add_css_class("rounded-image") # Assuming rounding via global style or similar
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
    
    if not is_user:
        copy_btn = Gtk.Button(icon_name="edit-copy-symbolic")
        copy_btn.add_css_class("flat")
        copy_btn.add_css_class("dim-label")
        copy_btn.set_halign(Gtk.Align.END)
        copy_btn.connect("clicked", lambda b: copy_to_clipboard(text))
        bubble_box.append(copy_btn)
    
    align = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
    if is_user:
        align.append(Gtk.Box(hexpand=True))
        align.append(bubble_box)
    else:
        align.append(bubble_box)
        align.append(Gtk.Box(hexpand=True))
        
    app.chat_box.append(align)
    GLib.idle_add(scroll_to_bottom, app)
    return bubble

def copy_to_clipboard(text: str) -> None:
    """Copies the provided text to the system clipboard."""
    clipboard = Gdk.Display.get_default().get_clipboard()
    clipboard.set(text)

def add_system_message(app, text: str) -> None:
    """Adds a system status message to the chat view."""
    label = Gtk.Label(label=text)
    label.add_css_class("system-status")
    label.set_margin_top(10)
    label.set_margin_bottom(10)
    app.chat_box.append(label)
    app.status_labels.append(label)
    GLib.idle_add(scroll_to_bottom, app)

def add_spinner(app) -> Gtk.Spinner:
    """Adds a spinner for loading/thinking states."""
    box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
    box.set_margin_top(10)
    box.set_margin_bottom(10)
    spinner = Gtk.Spinner()
    spinner.set_spinning(True)
    box.append(spinner)
    box.append(Gtk.Label(label="Thinking..."))
    app.chat_box.append(box)
    return box

def clear_status_labels(app) -> bool:
    """Removes all transient system messages from the view."""
    for label in app.status_labels:
        if label.get_parent() == app.chat_box:
            app.chat_box.remove(label)
    app.status_labels = []
    return False

def scroll_to_bottom(app) -> None:
    """Scrolls the chat view to the latest entry."""
    adj = app.scrolled.get_vadjustment()
    adj.set_value(adj.get_upper() - adj.get_page_size())

def chat_box_remove_all(app) -> None:
    """Clears all messages from the chat box."""
    child = app.chat_box.get_first_child()
    while child:
        app.chat_box.remove(child)
        child = app.chat_box.get_first_child()

def cancel_ai_task(app) -> None:
    """Cancels the current AI response task and clears 'Thinking' indicators."""
    if app.ai_task and not app.ai_task.done():
        app.ai_task.cancel()
    
    child = app.chat_box.get_first_child()
    while child:
        next_child = child.get_next_sibling()
        if isinstance(child, Gtk.Box):
            is_spinner = False
            inner = child.get_first_child()
            while inner:
                if isinstance(inner, Gtk.Label) and inner.get_text() == "Thinking...":
                    is_spinner = True
                    break
                inner = inner.get_next_sibling()
            
            if is_spinner:
                if child.get_parent() == app.chat_box:
                    app.chat_box.remove(child)
        child = next_child

    app.is_sending = False
    if hasattr(app, "unlock_ui"):
        GLib.idle_add(app.unlock_ui)
    else:
        # Fallback if unlock_ui is somehow not found
        app.input_box.set_sensitive(True)
        app.entry.set_editable(True)
        app.entry.grab_focus()

def update_thumbnail(app) -> None:
    """Refreshes the image thumbnail preview area."""
    child = app.thumb_box.get_first_child()
    while child:
        app.thumb_box.remove(child)
        child = app.thumb_box.get_first_child()

    if app.selected_image_path:
        img = Gtk.Image.new_from_file(app.selected_image_path)
        img.set_pixel_size(100)
        img.set_hexpand(True)
        app.thumb_box.append(img)
        btn = Gtk.Button(icon_name="window-close-symbolic")
        btn.connect("clicked", lambda b: on_remove_thumbnail(app))
        app.thumb_box.append(btn)

def on_remove_thumbnail(app) -> None:
    """Removes the selected image attachment."""
    app.selected_image_path = None
    update_thumbnail(app)
