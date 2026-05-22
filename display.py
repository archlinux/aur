"""
Module for chat display management.
Handles UI rendering, message bubble construction, and visual status updates.
"""
import init_gi
from gi.repository import Gtk, Gdk, GLib, GtkSource, Pango
import utils
import logging
from typing import Optional

def create_code_block(code: str, language_id: str) -> Gtk.ScrolledWindow:
    """Creates a GtkSourceView widget for syntax highlighting with theme support."""
    lang_manager = GtkSource.LanguageManager.get_default()
    
    # Map common markdown tags to GtkSource identifiers
    lang_map = {
        "python": "python",
        "py": "python",
        "python3": "python",
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
    if target_lang == "text":
        target_lang = "c"
    lang = lang_manager.get_language(target_lang)
    
    buffer = GtkSource.Buffer.new_with_language(lang) if lang else GtkSource.Buffer.new()
    buffer.set_text(code)
    
    # Apply a dark-friendly style scheme
    scheme_manager = GtkSource.StyleSchemeManager.get_default()
    scheme = scheme_manager.get_scheme("Adwaita-dark") or scheme_manager.get_scheme("oblivion")
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

def add_message(app, text: str, is_user: bool, attachments = None) -> Gtk.Label:
    """
    Renders a chat bubble, handling both plain text and code blocks, and visual attachments.
    """
    bubble_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
    bubble_box.add_css_class("user-bubble" if is_user else "assistant-bubble")
    
    # Process attachments (backward compatibility)
    att_list = []
    if attachments:
        if isinstance(attachments, str):
            att_list = [{"path": attachments, "type": "image"}]
        elif isinstance(attachments, list):
            att_list = attachments

    # If user message, render all attached images inline
    for att in att_list:
        if isinstance(att, dict) and att.get("type") == "image":
            path = att.get("path")
            if path:
                try:
                    texture = Gdk.Texture.new_from_filename(path)
                    img = Gtk.Image.new_from_paintable(texture)
                    img.set_pixel_size(240)
                    img.add_css_class("rounded-image")
                    bubble_box.append(img)
                except Exception as e:
                    logging.error(f"Failed to load image {path}: {e}")
                    img = Gtk.Image.new_from_icon_name("image-missing-symbolic")
                    img.set_pixel_size(64)
                    bubble_box.append(img)
        
    if text:
        text = text.strip()
        
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
    
    if text:
        copy_btn = Gtk.Button(icon_name="edit-copy-symbolic")
        copy_btn.add_css_class("flat")
        copy_btn.add_css_class("dim-label")
        copy_btn.add_css_class("copy-btn")
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
    """Copies the provided text to the system clipboard using GTK 4's ContentProvider."""
    clipboard = Gdk.Display.get_default().get_clipboard()
    content = Gdk.ContentProvider.new_for_value(text)
    clipboard.set_content(content)

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
        app.set_entry_locked(False)
        app.entry.grab_focus()

def update_thumbnail(app) -> None:
    """Refreshes the thumbnail preview area for selected attachments."""
    child = app.thumb_box.get_first_child()
    while child:
        app.thumb_box.remove(child)
        child = app.thumb_box.get_first_child()

    if not hasattr(app, "selected_attachments") or not app.selected_attachments:
        app.thumb_box.set_visible(False)
        return

    app.thumb_box.set_visible(True)
    
    for i, att in enumerate(app.selected_attachments):
        card_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)
        card_box.add_css_class("thumbnail-container")
        card_box.set_size_request(80, 95)
        
        overlay = Gtk.Overlay()
        overlay.set_halign(Gtk.Align.CENTER)
        overlay.set_valign(Gtk.Align.CENTER)
        
        if att["type"] == "image":
            try:
                texture = Gdk.Texture.new_from_filename(att["path"])
                img = Gtk.Image.new_from_paintable(texture)
                img.set_pixel_size(64)
                img.add_css_class("rounded-image-thumbnail")
            except Exception as e:
                logging.error(f"Failed to load thumbnail for {att['path']}: {e}")
                img = Gtk.Image.new_from_icon_name("image-missing-symbolic")
                img.set_pixel_size(64)
                img.add_css_class("rounded-image-thumbnail")
        else:
            img = Gtk.Image.new_from_icon_name("text-x-generic-symbolic")
            img.set_pixel_size(64)
            img.add_css_class("rounded-file-thumbnail")
            
        overlay.set_child(img)
        
        remove_btn = Gtk.Button(icon_name="window-close-symbolic")
        remove_btn.add_css_class("flat")
        remove_btn.add_css_class("remove-attachment-btn")
        remove_btn.set_halign(Gtk.Align.END)
        remove_btn.set_valign(Gtk.Align.START)
        
        remove_btn.connect("clicked", lambda b, idx=i: on_remove_attachment(app, idx))
        overlay.add_overlay(remove_btn)
        
        card_box.append(overlay)
        
        name_label = Gtk.Label(label=att["name"])
        name_label.set_halign(Gtk.Align.CENTER)
        name_label.set_max_width_chars(12)
        name_label.set_ellipsize(Pango.EllipsizeMode.END)
        name_label.add_css_class("caption")
        card_box.append(name_label)
        
        app.thumb_box.append(card_box)

def on_remove_attachment(app, index: int) -> None:
    """Removes a specific attachment from the selection list."""
    if hasattr(app, "selected_attachments") and 0 <= index < len(app.selected_attachments):
        app.selected_attachments.pop(index)
    update_thumbnail(app)

def on_remove_thumbnail(app) -> None:
    """Removes all attachments (fallback for single image removal)."""
    app.selected_attachments = []
    update_thumbnail(app)
