"""
Module for UI components and structure.
Handles initial widget layout construction using modern GTK4 & Libadwaita standards.
"""
import init_gi
from gi.repository import Gtk, Adw
import display

def _get_new_chat_icon() -> str:
    """Helper to safely query and return the best symbolic new tab/chat icon name."""
    from gi.repository import Gdk
    display_default = Gdk.Display.get_default()
    if display_default:
        icon_theme = Gtk.IconTheme.get_for_display(display_default)
        if icon_theme.has_icon("tab-new-symbolic"):
            return "tab-new-symbolic"
    return "document-new-symbolic"

def show_welcome_message(app):
    """Shows a modern, beautiful native welcome status page."""
    display.chat_box_remove_all(app)

    # Strictly disable all interactive elements
    app.model_btn.set_sensitive(False)
    app.model_btn.set_popover(None)
    app.model_btn.set_tooltip_text("Start a new chat to select a model.")

    app.set_entry_locked(True, "Start a new chat to begin")
    app.btn_send.set_sensitive(False)
    app.btn_repair.set_sensitive(False)
    app.btn_attach.set_sensitive(False)

    status_page = Adw.StatusPage()
    status_page.set_icon_name(_get_new_chat_icon())
        
    status_page.set_title("FastFlowLM")
    
    info_text = (
        "A premium native interface for local LLMs.\n\n"
        "• Crafted using modern GTK 4 &amp; Libadwaita standards\n"
        "• Dynamic multi-format attachments (Images &amp; Code/Text)\n"
        "• Keyboard-driven with advanced lock integration\n"
        "• Lightweight, lightning-fast native desktop performance\n"
        "• Real-time session and chat history management"
    )
    status_page.set_description(info_text)
    
    action_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=16)
    action_box.set_halign(Gtk.Align.CENTER)
    
    btn_start = Gtk.Button(label="Start New Chat")
    btn_start.add_css_class("pill")
    btn_start.add_css_class("accent-btn")
    btn_start.set_halign(Gtk.Align.CENTER)
    btn_start.set_size_request(200, -1)
    btn_start.connect("clicked", lambda b: app.on_new_chat(None))
    action_box.append(btn_start)

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
    
    action_box.append(credits_box)
    status_page.set_child(action_box)
    
    app.chat_box.append(status_page)

def build_sidebar(app) -> Adw.ToolbarView:
    """Builds a modern edge-to-edge sidebar with a separate HeaderBar."""
    toolbar_view = Adw.ToolbarView()
    
    sidebar_header = Adw.HeaderBar()
    sidebar_header.set_show_end_title_buttons(False)
    
    # New chat button in sidebar header where it naturally belongs
    app.btn_new = Gtk.Button(icon_name=_get_new_chat_icon())
    app.btn_new.set_tooltip_text("New Chat")
    app.btn_new.connect("clicked", app.on_new_chat)
    sidebar_header.pack_start(app.btn_new)
    
    # Options menu button in sidebar header
    app.options_btn = Gtk.MenuButton(icon_name="view-more-symbolic")
    app.options_btn.set_tooltip_text("Options")
    sidebar_header.pack_end(app.options_btn)
    
    toolbar_view.add_top_bar(sidebar_header)
    
    content_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    
    search_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    search_box.set_margin_start(16)
    search_box.set_margin_end(16)
    search_box.set_margin_bottom(12)
    search_box.set_margin_top(8)
    
    app.search_entry = Gtk.SearchEntry()
    app.search_entry.set_placeholder_text("Search chats...")
    app.search_entry.connect("search-changed", app.on_search_changed)
    search_box.append(app.search_entry)
    content_box.append(search_box)

    app.history_list = Gtk.ListBox()
    app.history_list.set_selection_mode(Gtk.SelectionMode.SINGLE)
    app.history_list.add_css_class("navigation-sidebar")
    app.history_list.connect("row-activated", app.on_history_row_activated)
    
    sidebar_scrolled = Gtk.ScrolledWindow()
    sidebar_scrolled.set_vexpand(True)
    sidebar_scrolled.set_child(app.history_list)
    content_box.append(sidebar_scrolled)
    
    toolbar_view.set_content(content_box)
    return toolbar_view

def build_main_content(app) -> Adw.ToolbarView:
    """Builds the main chat interface using a modern clamped ToolbarView layout."""
    toolbar_view = Adw.ToolbarView()
    
    app.header = Adw.HeaderBar()
    
    # Sidebar toggle button
    app.btn_sidebar = Gtk.ToggleButton(icon_name="sidebar-show-symbolic")
    app.btn_sidebar.set_active(True)
    app.btn_sidebar.set_tooltip_text("Toggle Sidebar")
    app.btn_sidebar.connect("toggled", lambda b: app.split_view.set_show_sidebar(b.get_active()))
    app.header.pack_start(app.btn_sidebar)
    
    # Model Repair button packed to the end of main header
    app.btn_repair = Gtk.Button(icon_name="view-refresh-symbolic")
    app.btn_repair.set_tooltip_text("Repair Model")
    app.btn_repair.connect("clicked", app.on_repair_clicked)
    app.header.pack_end(app.btn_repair)
    
    # Model selection menu in the center of the header bar
    app.model_btn = Gtk.MenuButton()
    app.header.set_title_widget(app.model_btn)
    
    toolbar_view.add_top_bar(app.header)
    
    # Content scroll area
    app.scrolled = Gtk.ScrolledWindow()
    app.scrolled.set_vexpand(True)
    app.scrolled.set_kinetic_scrolling(True)
    app.scrolled.add_css_class("chat-scroll")
    
    # Clamped chat box for consistent 800px readable content column
    clamp_chat = Adw.Clamp()
    clamp_chat.set_maximum_size(800)
    clamp_chat.set_tightening_threshold(600)
    
    app.chat_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
    app.chat_box.set_margin_top(18)
    app.chat_box.set_margin_bottom(18)
    app.chat_box.set_margin_start(16)
    app.chat_box.set_margin_end(16)
    
    clamp_chat.set_child(app.chat_box)
    app.scrolled.set_child(clamp_chat)
    toolbar_view.set_content(app.scrolled)
    
    # Bottom bar layout - handles clamped thumbnail queue and input area together
    bottom_bar_layout = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    
    clamp_bottom = Adw.Clamp()
    clamp_bottom.set_maximum_size(800)
    clamp_bottom.set_tightening_threshold(600)
    
    bottom_content = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
    bottom_content.set_margin_start(16)
    bottom_content.set_margin_end(16)
    bottom_content.set_margin_bottom(16)
    bottom_content.set_margin_top(8)
    
    # Attachment previews
    app.thumb_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
    app.thumb_box.set_margin_bottom(4)
    bottom_content.append(app.thumb_box)
    
    # Message typing area
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
    
    # Attachment paperclip button
    app.btn_attach = Gtk.Button(icon_name="paperclip-symbolic")
    app.btn_attach.add_css_class("flat")
    app.btn_attach.set_valign(Gtk.Align.CENTER)
    app.btn_attach.connect("clicked", app.on_attach_clicked)
    input_container.append(app.btn_attach)
    
    app.input_box.append(input_container)
    
    # Send button
    app.btn_send = Gtk.Button(icon_name="mail-send-symbolic")
    app.btn_send.add_css_class("circular")
    app.btn_send.add_css_class("accent-btn")
    app.btn_send.set_valign(Gtk.Align.CENTER)
    app.btn_send.connect("clicked", app.on_send)
    app.input_box.append(app.btn_send)
    
    bottom_content.append(app.input_box)
    clamp_bottom.set_child(bottom_content)
    bottom_bar_layout.append(clamp_bottom)
    
    toolbar_view.add_bottom_bar(bottom_bar_layout)
    return toolbar_view
