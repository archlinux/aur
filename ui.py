"""
Module for UI components and structure.
Handles initial widget layout construction.
"""
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
from gi.repository import Gtk, Adw

"""
Module for UI components and structure.
Handles initial widget layout construction.
"""
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
from gi.repository import Gtk, Adw
import display
def show_welcome_message(app):
    display.chat_box_remove_all(app)

    # Strictly disable all interactive elements and remove popover to prevent clicking
    app.model_btn.set_sensitive(False)
    app.model_btn.set_popover(None)
    app.model_btn.set_tooltip_text("Start a new chat to select a model.")

    app.entry.set_sensitive(False)
    app.btn_send.set_sensitive(False)
    app.btn_repair.set_sensitive(False)
    app.btn_attach.set_sensitive(False)
    # Create the welcome content
    welcome_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=24)
    # ... (rest of the UI construction)

    welcome_box.set_valign(Gtk.Align.CENTER)
    welcome_box.set_halign(Gtk.Align.CENTER)
    welcome_box.set_margin_top(40)
    welcome_box.set_margin_bottom(40)
    
    icon = Gtk.Image(icon_name="com.marley.FastFlowLM-gtk-symbolic")
    # Fallback to document-new if custom icon not found in system
    if not icon.get_paintable():
        icon.set_from_icon_name("document-new-symbolic")
    icon.set_pixel_size(96)
    icon.add_css_class("dim-label")
    welcome_box.append(icon)
    
    title = Gtk.Label(label="FastFlowLM")
    title.add_css_class("title-1")
    welcome_box.append(title)

    info_text = (
        "A modern, native interface for local LLMs.\n\n"
        "• Optimized for GTK 4 & Libadwaita\n"
        "• Advanced session & history management\n"
        "• Real-time NPU-accelerated performance\n"
        "• Local-first privacy and control"
    )
    
    label = Gtk.Label(label=info_text)
    label.set_justify(Gtk.Justification.CENTER)
    label.add_css_class("dim-label")
    welcome_box.append(label)
    
    btn_start = Gtk.Button(label="Start New Chat")
    btn_start.add_css_class("pill")
    btn_start.add_css_class("accent-btn")
    btn_start.set_halign(Gtk.Align.CENTER)
    btn_start.set_size_request(200, -1)
    btn_start.connect("clicked", lambda b: app.on_new_chat(None))
    welcome_box.append(btn_start)

    credits_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)
    credits_box.set_halign(Gtk.Align.CENTER)
    credits_box.set_margin_top(12)
    
    link_ui = Gtk.LinkButton(uri="https://github.com/marleylinux/FastFlowLM-gtk", label="FastFlowLM-gtk")
    link_ui.set_halign(Gtk.Align.CENTER)
    credits_box.append(link_ui)

    link_engine = Gtk.LinkButton(uri="https://github.com/FastFlowLM/FastFlowLM", label="Powered by FastFlowLM")
    link_engine.add_css_class("dim-label")
    link_engine.set_halign(Gtk.Align.CENTER)
    credits_box.append(link_engine)
    
    welcome_box.append(credits_box)
    
    # Center the box inside the chat area
    app.chat_box.append(welcome_box)

def build_sidebar(app) -> Gtk.Box:
    """Builds the sidebar UI, including history and search."""
    sidebar_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    sidebar_box.add_css_class("sidebar-list")
    
    sidebar_header = Adw.HeaderBar()
    sidebar_header.set_show_end_title_buttons(False)
    sidebar_box.append(sidebar_header)
    
    search_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    search_box.set_margin_start(16)
    search_box.set_margin_end(16)
    search_box.set_margin_bottom(16)
    search_box.set_margin_top(8)
    
    app.search_entry = Gtk.SearchEntry()
    app.search_entry.set_placeholder_text("Search chats...")
    app.search_entry.connect("search-changed", app.on_search_changed)
    search_box.append(app.search_entry)
    sidebar_box.append(search_box)

    app.history_list = Gtk.ListBox()
    app.history_list.set_selection_mode(Gtk.SelectionMode.SINGLE)
    app.history_list.add_css_class("navigation-sidebar")
    app.history_list.add_css_class("boxed-list")
    app.history_list.connect("row-activated", app.on_history_row_activated)
    
    sidebar_scrolled = Gtk.ScrolledWindow()
    sidebar_scrolled.set_vexpand(True)
    sidebar_scrolled.set_child(app.history_list)
    sidebar_box.append(sidebar_scrolled)
    return sidebar_box

def build_main_content(app) -> Gtk.Box:
    """Builds the main chat interface structure."""
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    app.header = Adw.HeaderBar()
    main_box.append(app.header)
    
    app.btn_sidebar = Gtk.ToggleButton(icon_name="sidebar-show-symbolic")
    app.btn_sidebar.set_active(True)
    app.btn_sidebar.connect("toggled", lambda b: app.split_view.set_show_sidebar(b.get_active()))
    app.header.pack_start(app.btn_sidebar)

    app.btn_new = Gtk.Button(icon_name="document-new-symbolic")
    app.btn_new.connect("clicked", app.on_new_chat)
    app.header.pack_start(app.btn_new)
    
    app.btn_repair = Gtk.Button(icon_name="view-refresh-symbolic")
    app.btn_repair.set_tooltip_text("Repair Model")
    app.btn_repair.connect("clicked", app.on_repair_clicked)
    app.header.pack_start(app.btn_repair)
    
    app.options_btn = Gtk.MenuButton(icon_name="view-more-symbolic")
    app.header.pack_start(app.options_btn)

    app.model_btn = Gtk.MenuButton()
    app.header.set_title_widget(app.model_btn)
    
    app.scrolled = Gtk.ScrolledWindow()
    app.scrolled.set_vexpand(True)
    app.scrolled.add_css_class("chat-scroll")
    app.chat_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
    app.chat_box.set_margin_top(18)
    app.chat_box.set_margin_bottom(18)
    
    app.scrolled.set_child(app.chat_box)
    main_box.append(app.scrolled)

    app.thumb_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
    app.thumb_box.set_margin_start(32)
    app.thumb_box.set_margin_end(32)
    main_box.append(app.thumb_box)

    app.input_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
    app.input_box.add_css_class("input-area")
    
    input_container = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
    input_container.add_css_class("input-view")
    input_container.set_hexpand(True)
    
    app.input_scroll = Gtk.ScrolledWindow()
    app.input_scroll.set_hexpand(True)
    app.input_scroll.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
    app.input_scroll.set_min_content_height(36)
    app.input_scroll.set_max_content_height(150)
    
    app.entry = Gtk.TextView()
    app.entry.set_wrap_mode(Gtk.WrapMode.WORD_CHAR)
    app.entry.set_accepts_tab(False)
    app.entry.set_valign(Gtk.Align.CENTER)
    
    key_ctrl = Gtk.EventControllerKey()
    key_ctrl.connect("key-pressed", app.on_key_pressed)
    app.entry.add_controller(key_ctrl)
    
    app.input_scroll.set_child(app.entry)
    input_container.append(app.input_scroll)
    
    app.btn_attach = Gtk.Button(icon_name="paperclip-symbolic")
    app.btn_attach.add_css_class("flat")
    app.btn_attach.set_valign(Gtk.Align.CENTER)
    app.btn_attach.connect("clicked", app.on_attach_clicked)
    input_container.append(app.btn_attach)

    app.input_box.append(input_container)
    
    app.btn_send = Gtk.Button(icon_name="mail-send-symbolic")
    app.btn_send.add_css_class("circular")
    app.btn_send.add_css_class("accent-btn")
    app.btn_send.set_valign(Gtk.Align.CENTER)
    app.btn_send.connect("clicked", app.on_send)
    app.input_box.append(app.btn_send)
    
    main_box.append(app.input_box)
    return main_box
