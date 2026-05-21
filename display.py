"""
Module for chat display management.
Handles UI rendering, message bubble construction, and visual status updates.
"""
import init_gi
from gi.repository import Gtk, Gdk, GLib, GtkSource
import utils
import logging
from typing import Optional

def create_code_block(code: str, language_id: str) -> Gtk.ScrolledWindow:
    """Creates a GtkSourceView widget for syntax highlighting with theme support."""
    lang_manager = GtkSource.LanguageManager.get_default()
    
    # Map common markdown tags to GtkSource identifiers
    lang_map = {
        "python": "python3",
        "py": "python3",
        "python3": "python3",
        "bash": "sh",
        "sh": "sh",
        "shell": "sh",
        "js": "js",
        "javascript": "js",
        "html": "html",
        "css": "css",
        "cpp": "cpp",
        "c++": "cpp",
        "c": "c",
        "json": "json"
    }
    
    target_lang = lang_map.get(language_id.lower(), language_id)
    lang = lang_manager.get_language(target_lang)
    
    buffer = GtkSource.Buffer.new_with_language(lang) if lang else GtkSource.Buffer.new()
    buffer.set_text(code)
    
    # Apply a dark-friendly style scheme
    scheme_manager = GtkSource.StyleSchemeManager.get_default()
    scheme = scheme_manager.get_scheme("adwaita") or scheme_manager.get_scheme("oblivion")
    if scheme:
        buffer.set_style_scheme(scheme)
    
    view = GtkSource.View.new_with_buffer(buffer)
    view.set_editable(False)
    view.set_show_line_numbers(True)
    view.set_monospace(True)
    view.set_wrap_mode(Gtk.WrapMode.WORD) # Enable wrapping
    view.add_css_class("code-block")
    
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_hexpand(True) # Force horizontal expansion
    scrolled.set_vexpand(False)
    scrolled.set_propagate_natural_height(True)
    scrolled.set_min_content_height(100) # Increased min height
    scrolled.set_min_content_width(350)  # Ensure a base width
    scrolled.set_max_content_height(600)
    scrolled.set_child(view)
    return scrolled

def add_message(app, text: str, is_user: bool, image_path: Optional[str] = None) -> Gtk.Label:
    """
    Renders a chat bubble, handling both plain text and code blocks.
    """
    bubble_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
    bubble_box.add_css_class("user-bubble" if is_user else "assistant-bubble")
    
    if image_path:
        try:
            texture = Gdk.Texture.new_from_filename(image_path)
            img = Gtk.Image.new_from_paintable(texture)
            img.set_pixel_size(240)
            img.add_css_class("rounded-image")
            bubble_box.append(img)
        except Exception as e:
            logging.error(f"Failed to load image {image_path}: {e}")
            img = Gtk.Image.new_from_icon_name("image-missing-symbolic")
            img.set_pixel_size(64)
            bubble_box.append(img)
        
    chunks = utils.parse_message(text)
    
    last_bubble = None
    for ctype, content, lang in chunks:
        if ctype == "code":
            bubble_box.append(create_code_block(content, lang))
        else:
            bubble = Gtk.Label()
            bubble.set_wrap(True)
            bubble.set_selectable(True)
            bubble.set_xalign(0)
            bubble.set_use_markup(True)
            bubble.set_markup(utils.markdown_to_pango(content))
            bubble_box.append(bubble)
            last_bubble = bubble
    
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
    return last_bubble

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
        try:
            texture = Gdk.Texture.new_from_filename(app.selected_image_path)
            img = Gtk.Image.new_from_paintable(texture)
            img.set_pixel_size(100)
            img.set_hexpand(True)
            app.thumb_box.append(img)
        except Exception as e:
            logging.error(f"Thumbnail load failed: {e}")
            img = Gtk.Image.new_from_icon_name("image-missing-symbolic")
            img.set_pixel_size(64)
            app.thumb_box.append(img)

        btn = Gtk.Button(icon_name="window-close-symbolic")
        btn.connect("clicked", lambda b: on_remove_thumbnail(app))
        app.thumb_box.append(btn)

def on_remove_thumbnail(app) -> None:
    """Removes the selected image attachment."""
    app.selected_image_path = None
    update_thumbnail(app)
