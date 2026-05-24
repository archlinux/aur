"""
ui.py - Main UI builder for ryzenadj-gtk
Builds the full Adw.ApplicationWindow with tabbed pages:
  - Dashboard (live monitoring)
  - Power (STAPM/PPT sliders)
  - Current (VRM/EDC sliders)
  - Thermal (temperature limits)
  - Timing (time constants)
"""
import init_gi
import gi
from gi.repository import Gtk, Adw, Gdk, GLib, Pango, GObject
import ryzen
import logging

log = logging.getLogger(__name__)


def get_cpu_name() -> str:
    try:
        with open("/proc/cpuinfo", "r") as f:
            for line in f:
                if "model name" in line:
                    name = line.split(":", 1)[1].strip()
                    # Clean up graphics/processor suffixes robustly
                    if " w/" in name:
                        name = name.split(" w/", 1)[0]
                    if " with " in name:
                        name = name.split(" with ", 1)[0]
                    name = name.replace("Processor", "")
                    # Shorten name if too long
                    if len(name) > 35:
                        name = name[:32] + "..."
                    return name.strip()
    except Exception:
        pass
    import platform
    return platform.processor() or "AMD Ryzen"



def build_dependency_missing_page(app) -> Adw.ToolbarView:
    """Build the page shown when the ryzenadj binary is missing from the system."""
    toolbar = Adw.ToolbarView()

    header = Adw.HeaderBar()
    header.add_css_class("main-header")
    win_title = Adw.WindowTitle()
    win_title.set_title("Ryzenadj-gtk")
    win_title.set_subtitle("Dependency Missing")
    header.set_title_widget(win_title)
    toolbar.add_top_bar(header)

    status = Adw.StatusPage()
    status.set_icon_name("software-update-urgent-symbolic")
    status.set_title("ryzenadj Not Found")
    status.set_description(
        "The core dependency 'ryzenadj' is missing from your system.\n\n"
        "Ryzenadj-gtk is a graphical wrapper and requires the command-line tool to function.\n\n"
        "Please install it from the AUR:\n"
        "  • yay -S ryzenadj (Recommended)\n"
        "  • yay -S ryzenadj-git (Alternative)\n\n"
        "After installing, please restart this application."
    )

    toolbar.set_content(status)
    return toolbar


# ─── Auth-required page ───────────────────────────────────────────────────────

def build_auth_required_page(app) -> Adw.ToolbarView:
    """Build the locked-out page shown when polkit auth is denied or cancelled.

    Explains WHY the app needs root, gives a sudoers hint, and offers a
    Retry button that re-invokes the single pkexec call (no retry loop).
    """
    toolbar = Adw.ToolbarView()

    # ── Header bar (consistent with main window chrome) ──
    header = Adw.HeaderBar()
    header.add_css_class("main-header")
    win_title = Adw.WindowTitle()
    win_title.set_title("Ryzenadj-gtk")
    win_title.set_subtitle("Authentication Required")
    header.set_title_widget(win_title)
    toolbar.add_top_bar(header)

    # ── Central status page ──
    status = Adw.StatusPage()
    status.set_icon_name("dialog-password-symbolic")
    status.set_title("Passwordless Sudo Configuration Required")
    status.set_description(
        "Ryzenadj-gtk requires a passwordless sudoers configuration to run.\n\n"
        "Running directly out of the repository without installation is not supported.\n"
        "Please install the application using your preferred installation method\n"
        "to configure secure passwordless sudo access:\n\n"
        "  • For Arch Linux: run 'makepkg -si'\n"
        "  • For other distributions: run 'sudo ./install.sh'\n\n"
        "This ensures silent, real-time background tracking without continuously\n"
        "prompting you for administrator privileges."
    )

    # ── Retry button ──
    retry_btn = Gtk.Button(label="🔄  Retry Verification")
    retry_btn.add_css_class("suggested-action")
    retry_btn.add_css_class("pill")
    retry_btn.set_margin_top(8)
    retry_btn.connect("clicked", lambda _b: app._retry_auth())

    status.set_child(retry_btn)
    toolbar.set_content(status)
    return toolbar


# ─── Helpers ──────────────────────────────────────────────────────────────────

def _bar_class(fraction: float) -> str:
    if fraction < 0.5:
        return "low"
    elif fraction < 0.8:
        return "medium"
    return "high"


def _fmt(value: float, divisor: float, unit: str) -> str:
    """Format a value for display. divisor converts native->display units."""
    v = value / divisor
    if unit == "":
        return f"{v:+.0f}" if v != 0 else "0"
    if unit in ("mW", "mA"):
        return f"{v:.0f} {unit}"
    if unit in ("W", "A"):
        return f"{v:.1f} {unit}"
    if unit == "°C":
        return f"{v:.1f}{unit}"
    if unit == "s":
        return f"{v:.0f} {unit}"
    return f"{v:.1f} {unit}"


# ─── Slider row ───────────────────────────────────────────────────────────────

def _build_slider_row(meta: dict, current_info: dict, pending: dict, is_supported: bool = True) -> Gtk.ListBoxRow:
    """
    Build a custom Gtk.ListBoxRow with:
      - Mono command-line flag name (--param) on the top-left
      - Small italicized description directly below it
      - Live hardware reading badge on the top-right
      - Full-width slider below the text labels
      - Target value pill badge on the bottom-right
    """
    param = meta["param"]
    desc  = meta["desc"]
    lo    = meta["min"]
    hi    = meta["max"]
    step  = meta["step"]
    div   = meta["display_divisor"]   # how many native units per display unit
    dunit = meta["display_unit"]
    vkey  = meta["value_key"]         # key in ryzenadj -i output

    row = Gtk.ListBoxRow()
    row.add_css_class("slider-row-item")
    row.set_selectable(False)
    row.set_activatable(False)

    # Main vertical box for the row content
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    main_box.set_margin_start(16)
    main_box.set_margin_end(16)
    main_box.set_margin_top(12)
    main_box.set_margin_bottom(12)

    # ── Top Row (Text labels on left, Live badge on right) ──
    top_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
    
    # Left text box (flag + optional CPU/GPU tag + small italic description)
    text_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
    text_box.set_hexpand(True)
    
    flag_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
    
    title_label = Gtk.Label(xalign=0)
    title_label.set_markup(f"<span font_family='monospace' weight='bold' size='medium'>--{param}</span>")
    title_label.add_css_class("slider-row-flag")
    flag_box.append(title_label)

    # Render GPU tag or CPU tag if flagged in metadata
    if meta.get("is_gpu", False):
        gpu_tag_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        gpu_tag_box.add_css_class("gpu-badge")
        gpu_tag_box.set_valign(Gtk.Align.CENTER)
        
        gpu_icon = Gtk.Image.new_from_icon_name("video-display-symbolic")
        gpu_icon.set_pixel_size(12)
        gpu_tag_box.append(gpu_icon)
        
        gpu_label = Gtk.Label(label="GPU")
        gpu_tag_box.append(gpu_label)
        
        flag_box.append(gpu_tag_box)
    elif meta.get("is_cpu", False):
        cpu_tag_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        cpu_tag_box.add_css_class("cpu-badge")
        cpu_tag_box.set_valign(Gtk.Align.CENTER)
        
        cpu_icon = Gtk.Image.new_from_icon_name("utilities-system-monitor-symbolic")
        cpu_icon.set_pixel_size(12)
        cpu_tag_box.append(cpu_icon)
        
        cpu_label = Gtk.Label(label="CPU")
        cpu_tag_box.append(cpu_label)
        
        flag_box.append(cpu_tag_box)
        
    text_box.append(flag_box)

    desc_text = desc
    if not is_supported:
        desc_text = f"{desc} <span color='#e01b24' weight='bold' size='small'>(Unsupported on this CPU)</span>"

    desc_label = Gtk.Label(xalign=0)
    desc_label.set_markup(f"<span style='italic' size='small'>{desc_text}</span>")
    desc_label.add_css_class("slider-row-desc")
    
    text_box.append(desc_label)
    top_box.append(text_box)

    # Right side: Live badge
    cur_raw = current_info.get(vkey)
    if cur_raw is not None:
        cur_text = f"Live: {_fmt(cur_raw, 1, dunit)}"
        cur_cli = cur_raw * div
    else:
        cur_text = "Live: —"
        cur_cli  = None

    cur_badge = Gtk.Label(label=cur_text)
    cur_badge.add_css_class("live-badge")
    cur_badge.set_tooltip_text("Live reading from hardware")
    cur_badge.set_valign(Gtk.Align.CENTER)
    top_box.append(cur_badge)

    main_box.append(top_box)

    # ── Bottom Row (Slider + Target badge) ──
    bottom_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
    bottom_box.set_margin_top(10)
    
    # Slider setup
    if param in pending:
        init_val = float(pending[param])
    elif cur_cli is not None:
        init_val = max(lo, min(hi, cur_cli))
    else:
        init_val = float(meta.get("default", lo))

    adj = Gtk.Adjustment(
        value=init_val,
        lower=lo,
        upper=hi,
        step_increment=step,
        page_increment=step * 10,
        page_size=0,
    )
    slider = Gtk.Scale(orientation=Gtk.Orientation.HORIZONTAL, adjustment=adj)
    slider.set_hexpand(True)
    slider.set_valign(Gtk.Align.CENTER)
    slider.set_draw_value(False)
    slider.set_tooltip_text(f"Range: {lo} – {hi} {meta['unit']}")

    # Target badge
    target_badge = Gtk.Label()
    target_badge.add_css_class("target-badge")
    target_badge.set_valign(Gtk.Align.CENTER)
    target_badge.set_size_request(100, -1)

    def update_val_label(scale):
        v = scale.get_value()
        target_badge.set_text(f"Target: {_fmt(v, div, dunit)}")
        pending[param] = int(v)

    slider.connect("value-changed", update_val_label)
    update_val_label(slider)  # set initial text

    bottom_box.append(slider)
    bottom_box.append(target_badge)
    
    main_box.append(bottom_box)

    row.set_child(main_box)

    if not is_supported:
        row.set_sensitive(False)

    # Store widget refs for refresh later
    row._slider     = slider
    row._cur_badge  = cur_badge
    row._param_meta = meta
    row._desc_label = desc_label

    return row


def _fmt_limit(limit: float | None, unit: str) -> str:
    if limit is None or limit <= 0:
        return "Uncapped"
    if unit == "°C":
        return f"Limit: {limit:.0f}°C"
    if unit == "s":
        return f"Limit: {limit:.0f}s"
    return f"Limit: {limit:.1f} {unit}"


# ─── Monitor card ─────────────────────────────────────────────────────────────

def _build_monitor_card(val_key: str, lim_key: str | None,
                        label: str, unit: str,
                        icon_name: str, current_info: dict) -> Gtk.Box:
    """
    Overhauled monitor card with icons and premium typography.
    """
    val   = current_info.get(val_key)
    limit = current_info.get(lim_key) if lim_key else None

    card = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)
    card.add_css_class("monitor-card")
    card.set_hexpand(True)

    # Top Row: Icon + Name (left) & Limit badge (right)
    top_row = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
    top_row.set_hexpand(True)

    icon = Gtk.Image.new_from_icon_name(icon_name)
    icon.add_css_class("monitor-icon")
    top_row.append(icon)

    name_lbl = Gtk.Label(label=label)
    name_lbl.add_css_class("monitor-name-label")
    name_lbl.set_halign(Gtk.Align.START)
    name_lbl.set_hexpand(True)
    top_row.append(name_lbl)

    limit_str = _fmt_limit(limit, unit)
    lim_lbl = Gtk.Label(label=limit_str)
    lim_lbl.add_css_class("monitor-limit-badge")
    lim_lbl.set_halign(Gtk.Align.END)
    top_row.append(lim_lbl)

    card.append(top_row)

    # Middle Row: Big Value + unit
    val_row = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
    val_row.set_halign(Gtk.Align.START)
    val_row.set_margin_top(8)

    val_str = f"{val:.1f}" if val is not None else "—"
    val_lbl = Gtk.Label(label=val_str)
    val_lbl.add_css_class("monitor-value-label")
    val_row.append(val_lbl)

    unit_lbl = Gtk.Label(label=unit)
    unit_lbl.add_css_class("monitor-unit-label")
    unit_lbl.set_valign(Gtk.Align.END)
    unit_lbl.set_margin_bottom(6)
    val_row.append(unit_lbl)
    card.append(val_row)

    # Bottom Row: Progress bar
    fraction = 0.0
    if val is not None and limit and limit > 0:
        fraction = min(1.0, val / limit)

    bar = Gtk.ProgressBar()
    bar.add_css_class("usage-bar")
    bar.set_fraction(fraction)
    bar.add_css_class(_bar_class(fraction))
    card.append(bar)

    # Refs for refresh
    card._val_lbl   = val_lbl
    card._lim_lbl   = lim_lbl
    card._bar       = bar
    card._val_key   = val_key
    card._lim_key   = lim_key
    card._unit      = unit

    return card


# ─── Dashboard page ────────────────────────────────────────────────────────────

def _make_card_grid(app, defs: list[tuple]) -> Gtk.Grid:
    """Build a strict grid layout for monitor cards.
    - 4 items: 2x2 grid
    - 3 items: 2 on top, 1 on bottom filling full width
    - 2 items: 1 on top, 1 on bottom, both filling full width
    """
    grid = Gtk.Grid()
    grid.set_column_homogeneous(True)
    grid.set_row_homogeneous(False)
    grid.set_column_spacing(16)
    grid.set_row_spacing(16)
    grid.set_margin_bottom(12)

    count = len(defs)
    
    for i, (val_key, lim_key, label, unit, icon_name) in enumerate(defs):
        card = _build_monitor_card(val_key, lim_key, label, unit, icon_name, app.current_info)
        app._dashboard_cards.append(card)
        
        if count == 4:
            # 2x2 Layout
            col = i % 2
            row = i // 2
            grid.attach(card, col, row, 1, 1)
        elif count == 3:
            # 2 on top, 1 on bottom filling both columns
            if i < 2:
                grid.attach(card, i, 0, 1, 1)
            else:
                grid.attach(card, 0, 1, 2, 1)
        elif count == 2:
            # 1 and 1, both filling both columns
            grid.attach(card, 0, i, 2, 1)
        else:
            # Fallback for other counts
            grid.attach(card, 0, i, 2, 1)
            
    return grid


def _build_section_header(title: str, icon_name: str) -> Gtk.Box:
    """Build a Ptyxis-style section header for the dashboard."""
    box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
    box.add_css_class("section-title-box")
    
    icon = Gtk.Image.new_from_icon_name(icon_name)
    icon.add_css_class("category-icon")
    box.append(icon)
    
    label = Gtk.Label(label=title)
    label.add_css_class("section-title-label")
    box.append(label)
    
    return box


def _build_dashboard_page(app) -> Gtk.ScrolledWindow:
    app._dashboard_cards = []

    # ── Main container (Scrolled + Centered Clamp) ──
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_vexpand(True)
    scrolled.set_name("dashboard")
    # Store title and icon on the scrolled window for the view stack to read
    scrolled.get_title = lambda: "Dashboard"
    
    clamp = Adw.Clamp()
    clamp.set_maximum_size(1000)
    clamp.set_margin_top(24)
    clamp.set_margin_bottom(32)
    clamp.set_margin_start(16)
    clamp.set_margin_end(16)
    scrolled.set_child(clamp)
    
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
    clamp.set_child(main_box)

    # ── 0. Hero Status Banner (Ultra-Modern) ──
    hero_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
    hero_box.add_css_class("hero-box")
    hero_box.set_halign(Gtk.Align.FILL)

    # Left: Pulsating Status
    status_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    status_box.set_valign(Gtk.Align.CENTER)
    status_pill = Gtk.Label(label="● Live")
    status_pill.add_css_class("live-status-pill")
    status_box.append(status_pill)
    hero_box.append(status_box)

    # Center: Icon + Text
    center_content = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=16)
    center_content.set_hexpand(True)
    center_content.set_halign(Gtk.Align.CENTER)

    hero_icon = Gtk.Image.new_from_icon_name("utilities-system-monitor-symbolic")
    hero_icon.set_pixel_size(48)
    hero_icon.add_css_class("hero-icon")
    center_content.append(hero_icon)

    text_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
    text_box.set_valign(Gtk.Align.CENTER)

    title_lbl = Gtk.Label(label="System Dashboard")
    title_lbl.add_css_class("hero-title")
    title_lbl.set_halign(Gtk.Align.START)
    text_box.append(title_lbl)

    subtitle_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
    
    subtitle_lbl = Gtk.Label(label="Active monitoring for")
    subtitle_lbl.add_css_class("hero-subtitle")
    subtitle_box.append(subtitle_lbl)

    cpu_badge = Gtk.Label(label=get_cpu_name())
    cpu_badge.add_css_class("hero-cpu-badge")
    subtitle_box.append(cpu_badge)
    
    text_box.append(subtitle_box)
    center_content.append(text_box)
    
    hero_box.append(center_content)

    # Right: Placeholder for symmetry or future buttons
    right_spacer = Gtk.Box()
    right_spacer.set_size_request(80, -1) # Match pill width roughly
    hero_box.append(right_spacer)

    main_box.append(hero_box)

    # ── Diagnostics Banner (Dynamic checking) ──
    diagnostic_card = Adw.ActionRow()
    diagnostic_card.set_title("System Memory Lockdown Detected")
    diagnostic_card.set_subtitle("Secure Boot or Kernel Lockdown is active, which blocks ryzenadj from writing parameters to SMU.")
    diagnostic_card.add_css_class("diagnostic-warning-row")
    diagnostic_card.set_visible(False)
    
    app.diagnostic_banner = diagnostic_card
    
    grp_diag = Adw.PreferencesGroup()
    grp_diag.add(diagnostic_card)
    grp_diag.set_margin_top(16)
    main_box.append(grp_diag)

    # ── Power Envelope Section ──
    main_box.append(_build_section_header("Power Envelope", "battery-symbolic"))
    
    grp_power = Adw.PreferencesGroup()
    grp_power.add_css_class("dashboard-group")
    
    power_grid = _make_card_grid(app, [
        ("STAPM VALUE",   "STAPM LIMIT",    "STAPM",     "W", "battery-symbolic"),
        ("PPT VALUE FAST","PPT LIMIT FAST", "PPT Fast",  "W", "battery-symbolic"),
        ("PPT VALUE SLOW","PPT LIMIT SLOW", "PPT Slow",  "W", "battery-symbolic"),
        ("PPT VALUE APU", "PPT LIMIT APU",  "APU PPT",   "W", "battery-symbolic"),
    ])
    grp_power.add(power_grid)
    main_box.append(grp_power)

    # ── Electrical Current Section ──
    main_box.append(_build_section_header("Electrical Current", "thunderbolt-symbolic"))

    grp_current = Adw.PreferencesGroup()
    grp_current.add_css_class("dashboard-group")

    current_grid = _make_card_grid(app, [
        ("TDC VALUE VDD", "TDC LIMIT VDD", "TDC VDD", "A", "thunderbolt-symbolic"),
        ("TDC VALUE SOC", "TDC LIMIT SOC", "TDC SoC", "A", "thunderbolt-symbolic"),
        ("EDC VALUE VDD", "EDC LIMIT VDD", "EDC VDD", "A", "thunderbolt-symbolic"),
        ("EDC VALUE SOC", "EDC LIMIT SOC", "EDC SoC", "A", "thunderbolt-symbolic"),
    ])
    grp_current.add(current_grid)
    main_box.append(grp_current)

    # ── Thermal Status Section ──
    main_box.append(_build_section_header("Thermal Status", "sensors-temperature-symbolic"))

    grp_thermal = Adw.PreferencesGroup()
    grp_thermal.add_css_class("dashboard-group")

    thermal_flow = _make_card_grid(app, [
        ("THM VALUE CORE", "THM LIMIT CORE", "CPU Die",       "°C", "sensors-temperature-symbolic"),
        ("STT VALUE APU",  "STT LIMIT APU",  "APU Skin",      "°C", "sensors-temperature-symbolic"),
        ("STT VALUE dGPU", "STT LIMIT dGPU", "dGPU Skin",     "°C", "sensors-temperature-symbolic"),
    ])
    grp_thermal.add(thermal_flow)
    main_box.append(grp_thermal)

    # ── Power Automation Section ──
    main_box.append(_build_section_header("Power Automation", "battery-action-symbolic"))

    grp_automation = Adw.PreferencesGroup()
    grp_automation.set_description("Automatically swap profiles based on power supply charging state")

    switch_auto = Adw.SwitchRow()
    switch_auto.set_title("Auto-switch profiles on power change")
    switch_auto.set_subtitle("Automatically switch profiles when AC charger is plugged in or disconnected")
    switch_auto.set_icon_name("battery-action-symbolic")
    switch_auto.set_active(app.ui_settings.get("auto_switch", False))
    grp_automation.add(switch_auto)

    ac_row = Adw.ComboRow()
    ac_row.set_title("Plugged into AC Power")
    ac_row.set_subtitle("Profile applied when connected to charger")
    ac_row.set_icon_name("battery-charging-symbolic")
    grp_automation.add(ac_row)

    bat_row = Adw.ComboRow()
    bat_row.set_title("Running on Battery")
    bat_row.set_subtitle("Profile applied when running on battery")
    bat_row.set_icon_name("battery-symbolic")
    grp_automation.add(bat_row)

    main_box.append(grp_automation)

    # Populate models dynamically
    def update_automation_dropdowns():
        profiles = list(sorted(ryzen.load_profiles().keys()))
        options = ["Stock (No Profile)", "⚡ Power Saving Preset", "🚀 Max Performance Preset"] + profiles
        option_keys = ["", "__power_saving__", "__max_performance__"] + profiles
        
        model_ac = Gtk.StringList.new(options)
        model_bat = Gtk.StringList.new(options)
        
        ac_row.set_model(model_ac)
        bat_row.set_model(model_bat)
        
        saved_ac = app.ui_settings.get("ac_profile", "")
        saved_bat = app.ui_settings.get("battery_profile", "")
        
        try:
            ac_idx = option_keys.index(saved_ac)
            ac_row.set_selected(ac_idx)
        except ValueError:
            ac_row.set_selected(0)
            
        try:
            bat_idx = option_keys.index(saved_bat)
            bat_row.set_selected(bat_idx)
        except ValueError:
            if not saved_bat and "__power_saving__" in option_keys:
                bat_row.set_selected(1) # Default to Power Saving Preset
            else:
                bat_row.set_selected(0)

        ac_row._option_keys = option_keys
        bat_row._option_keys = option_keys

    app.update_automation_dropdowns = update_automation_dropdowns
    update_automation_dropdowns()

    def on_auto_switch_toggled(switch_row, _spec):
        active = switch_row.get_active()
        app.ui_settings["auto_switch"] = active
        app._save_ui_settings()
        ac_row.set_sensitive(active)
        bat_row.set_sensitive(active)

    def on_ac_selected(row, _spec):
        idx = row.get_selected()
        if hasattr(row, "_option_keys") and idx < len(row._option_keys):
            app.ui_settings["ac_profile"] = row._option_keys[idx]
            app._save_ui_settings()

    def on_bat_selected(row, _spec):
        idx = row.get_selected()
        if hasattr(row, "_option_keys") and idx < len(row._option_keys):
            app.ui_settings["battery_profile"] = row._option_keys[idx]
            app._save_ui_settings()

    switch_auto.connect("notify::active", on_auto_switch_toggled)
    ac_row.connect("notify::selected", on_ac_selected)
    bat_row.connect("notify::selected", on_bat_selected)

    # Initial sensitivity
    ac_row.set_sensitive(app.ui_settings.get("auto_switch", False))
    bat_row.set_sensitive(app.ui_settings.get("auto_switch", False))

    # ── Persistence Guard Section ──
    main_box.append(_build_section_header("Persistence Guard", "security-high-symbolic"))

    grp_persistence = Adw.PreferencesGroup()
    grp_persistence.set_description("Periodically verify and re-apply settings to counter thermal or system power overrides")

    switch_persist = Adw.SwitchRow()
    switch_persist.set_title("Enable Persistence Guard")
    switch_persist.set_subtitle("⚠️ Re-applies active registers periodically. Lower verification intervals may cause system overhead or responsiveness impact depending on your configuration.")
    switch_persist.set_icon_name("security-high-symbolic")
    switch_persist.set_active(app.ui_settings.get("persistence_enabled", False))
    grp_persistence.add(switch_persist)

    persist_interval_row = Adw.ComboRow()
    persist_interval_row.set_title("Verification Interval")
    persist_interval_row.set_subtitle("Time elapsed between checks and re-applications")
    persist_interval_row.set_icon_name("alarm-symbolic")
    
    interval_options = [
        "5 seconds (High Overhead)",
        "10 seconds (Medium Overhead)",
        "30 seconds (Recommended)",
        "60 seconds (Lightweight)"
    ]
    interval_values = [5, 10, 30, 60]
    
    model_persist = Gtk.StringList.new(interval_options)
    persist_interval_row.set_model(model_persist)
    
    saved_interval = app.ui_settings.get("persistence_interval", 30)
    try:
        selected_idx = interval_values.index(saved_interval)
        persist_interval_row.set_selected(selected_idx)
    except ValueError:
        persist_interval_row.set_selected(2) # Default to 30 seconds

    grp_persistence.add(persist_interval_row)
    main_box.append(grp_persistence)

    def on_persistence_toggled(switch_row, _spec):
        active = switch_row.get_active()
        app.ui_settings["persistence_enabled"] = active
        app._persistence_ticks = 0 # reset counter
        app._save_ui_settings()
        persist_interval_row.set_sensitive(active)

    def on_persistence_interval_selected(row, _spec):
        idx = row.get_selected()
        if idx < len(interval_values):
            app.ui_settings["persistence_interval"] = interval_values[idx]
            app._persistence_ticks = 0 # reset counter
            app._save_ui_settings()

    switch_persist.connect("notify::active", on_persistence_toggled)
    persist_interval_row.connect("notify::selected", on_persistence_interval_selected)
    
    # Initial sensitivity
    persist_interval_row.set_sensitive(app.ui_settings.get("persistence_enabled", False))

    # ── Service & Tuning group ──
    main_box.append(_build_section_header("System and Tuning", "settings-symbolic"))

    grp_service = Adw.PreferencesGroup()
    grp_service.set_description("Manage boot persistence and extreme tuning bounds")

    switch_row = Adw.SwitchRow()
    switch_row.set_title("Apply settings on startup")
    switch_row.set_subtitle("Automatically write saved limits to Ryzen hardware on system boot via systemd service")
    switch_row.set_icon_name("system-run-symbolic")
    switch_row.set_active(ryzen.is_service_enabled())
    
    app.switch_startup = switch_row
    switch_row.connect("notify::active", app.on_startup_switch_toggled)
    grp_service.add(switch_row)

    # Enthusiast Mode Row
    switch_enthusiast = Adw.SwitchRow()
    switch_enthusiast.set_title("Enthusiast Mode (Extreme Tuning)")
    switch_enthusiast.set_subtitle("Extend power limits up to 250W (250,000 mW) and currents up to 500A (Ensure high-wattage PSU and adequate cooling!)")
    switch_enthusiast.set_icon_name("dialog-warning-symbolic")
    switch_enthusiast.set_active(app.enthusiast_mode)
    
    app.switch_enthusiast = switch_enthusiast
    switch_enthusiast.connect("notify::active", app.on_enthusiast_toggled)
    grp_service.add(switch_enthusiast)

    # ── Factory Reset ──
    btn_reset = Gtk.Button()
    btn_reset.set_tooltip_text("Wipe all settings, disable startup service, and prepare for reboot")
    btn_reset.add_css_class("destructive-action")
    btn_reset.add_css_class("pill")
    btn_reset.set_margin_top(16)
    btn_reset.set_halign(Gtk.Align.CENTER)
    
    btn_reset_content = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
    btn_reset_icon = Gtk.Image.new_from_icon_name("edit-clear-all-symbolic")
    btn_reset_label = Gtk.Label(label="Factory Reset")
    btn_reset_content.append(btn_reset_icon)
    btn_reset_content.append(btn_reset_label)
    btn_reset.set_child(btn_reset_content)
    
    btn_reset.connect("clicked", app.on_factory_reset_clicked)
    
    grp_service.add(btn_reset)

    main_box.append(grp_service)

    return scrolled


# ─── Slider pages ──────────────────────────────────────────────────────────────

def _build_slider_page(
    app,
    title: str,
    icon: str,
    name: str,
    groups: list,
) -> Gtk.ScrolledWindow:
    """
    Overhauled settings page with modern centered layout and section headers.
    """
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_vexpand(True)
    scrolled.set_name(name)
    scrolled.get_title = lambda: title
    
    clamp = Adw.Clamp()
    clamp.set_maximum_size(1000)
    clamp.set_margin_top(24)
    clamp.set_margin_bottom(32)
    clamp.set_margin_start(16)
    clamp.set_margin_end(16)
    scrolled.set_child(clamp)
    
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
    clamp.set_child(main_box)

    for grp_title, grp_desc, param_list in groups:
        # Modern Ptyxis-style section header
        header_box = _build_section_header(grp_title, icon)
        main_box.append(header_box)
        
        grp = Adw.PreferencesGroup()
        if grp_desc:
            grp.set_description(grp_desc)

        # Special conditional handling for power page timing limits
        if name == "power" and grp_title == "Time Constants":
            app.timing_preferences_group = grp
            app.timing_preferences_header = header_box
            grp.set_visible(app.enthusiast_mode)
            header_box.set_visible(app.enthusiast_mode)

        for meta in param_list:
            is_supported = True
            param = meta["param"]
            is_co = param.startswith("set-co")
            if not is_co and hasattr(app, "supported_params"):
                is_supported = param in app.supported_params

            row = _build_slider_row(meta, app.current_info, app.pending_settings, is_supported)
            grp.add(row)
            app._slider_rows[meta["param"]] = row

        main_box.append(grp)

    return scrolled


def _build_profiles_page(app) -> Gtk.ScrolledWindow:
    """Build an ultra-modern custom profiles manager page."""
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_vexpand(True)
    scrolled.set_name("profiles")
    scrolled.get_title = lambda: "Profiles"
    
    clamp = Adw.Clamp()
    clamp.set_maximum_size(1000)
    clamp.set_margin_top(24)
    clamp.set_margin_bottom(32)
    clamp.set_margin_start(16)
    clamp.set_margin_end(16)
    scrolled.set_child(clamp)
    
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
    clamp.set_child(main_box)

    # 1. Save Current Configuration Header
    main_box.append(_build_section_header("Save Current Profile", "document-save-symbolic"))
    
    grp_save = Adw.PreferencesGroup()
    grp_save.set_description("Save your current tuning state as a reusable power profile")

    # Entry row for profile name
    name_row = Adw.EntryRow()
    name_row.set_title("Profile Name")
    
    # Save button
    btn_save = Gtk.Button(label="Save Profile")
    btn_save.add_css_class("suggested-action")
    btn_save.add_css_class("pill")
    btn_save.set_valign(Gtk.Align.CENTER)
    
    name_row.add_suffix(btn_save)
    grp_save.add(name_row)
    main_box.append(grp_save)

    # 2. Saved Profiles Header
    main_box.append(_build_section_header("Managed Profiles", "bookmarks-symbolic"))

    grp_list = Adw.PreferencesGroup()
    grp_list.set_description("Manage and apply your custom Ryzen power profiles")
    main_box.append(grp_list)

    # Boxed list standard ListBox
    list_box = Gtk.ListBox()
    list_box.add_css_class("boxed-list")
    grp_list.add(list_box)

    app.profiles_listbox = list_box
    app.profile_name_row = name_row

    def refresh_profiles():
        # Clear existing items
        while True:
            child = list_box.get_first_child()
            if not child:
                break
            list_box.remove(child)

        if hasattr(app, "update_automation_dropdowns") and app.update_automation_dropdowns:
            app.update_automation_dropdowns()

        profiles = ryzen.load_profiles()
        if not profiles:
            # Show empty state row
            empty_row = Adw.ActionRow()
            empty_row.set_title("No saved profiles")
            empty_row.set_subtitle("Type a name above to create your first custom profile.")
            empty_row.set_sensitive(False)
            list_box.append(empty_row)
            return

        for name, settings in sorted(profiles.items()):
            row = Adw.ActionRow()
            row.set_title(name)
            
            # Build a summary string of the settings
            summary_parts = []
            for k, v in settings.items():
                meta = next((m for m in ryzen.SETTINGS_PARAMS if m["param"] == k), None)
                if meta:
                    val_str = _fmt(v, meta["display_divisor"], meta["display_unit"])
                    summary_parts.append(f"{meta['label']}: {val_str}")
            
            summary_text = ", ".join(summary_parts) if summary_parts else "No parameters configured"
            row.set_subtitle(summary_text)

            btn_apply = Gtk.Button(icon_name="object-select-symbolic")
            btn_apply.add_css_class("flat")
            btn_apply.set_tooltip_text(f"Apply '{name}' profile")
            
            btn_delete = Gtk.Button(icon_name="user-trash-symbolic")
            btn_delete.add_css_class("flat")
            btn_delete.add_css_class("destructive-action")
            btn_delete.set_tooltip_text(f"Delete '{name}' profile")

            def make_on_apply(p_name, p_settings):
                def on_apply(_btn):
                    for param, val in p_settings.items():
                        app.pending_settings[param] = val
                        if param in app._slider_rows:
                            row_widget = app._slider_rows[param]
                            slider = getattr(row_widget, "_slider", None)
                            if slider:
                                slider.set_value(float(val))
                    app.on_apply_clicked(None)
                return on_apply

            def make_on_delete(p_name):
                def on_delete(_btn):
                    all_profiles = ryzen.load_profiles()
                    if p_name in all_profiles:
                        del all_profiles[p_name]
                        ryzen.save_profiles(all_profiles)
                        app._show_toast(f"Profile '{p_name}' deleted.", is_error=False)
                        refresh_profiles()
                return on_delete

            btn_apply.connect("clicked", make_on_apply(name, settings))
            btn_delete.connect("clicked", make_on_delete(name))

            suffix_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
            suffix_box.append(btn_apply)
            suffix_box.append(btn_delete)
            row.add_suffix(suffix_box)
            list_box.append(row)

    def on_save_clicked(_btn):
        name = name_row.get_text().strip()
        if not name:
            app._show_toast("Please enter a profile name.", is_error=True)
            return
        
        current_settings = dict(app.pending_settings)
        if not current_settings:
            app._show_toast("No settings are configured to save.", is_error=True)
            return
            
        profiles = ryzen.load_profiles()
        profiles[name] = current_settings
        ryzen.save_profiles(profiles)
        
        name_row.set_text("")
        app._show_toast(f"Profile '{name}' saved successfully!", is_error=False)
        refresh_profiles()

    btn_save.connect("clicked", on_save_clicked)
    app.refresh_profiles_list = refresh_profiles
    refresh_profiles()

    return scrolled


# ─── Main window builder ───────────────────────────────────────────────────────

def build_main_window(app) -> Adw.ApplicationWindow:
    win = Adw.ApplicationWindow(application=app)
    win.set_default_size(1050, 780)
    win.set_title("Ryzenadj-gtk")
    win.add_css_class("ryzenadj-win")

    # Refresh button
    app.btn_refresh = Gtk.Button(icon_name="view-refresh-symbolic")
    app.btn_refresh.set_tooltip_text("Refresh readings (F5)")
    app.btn_refresh.connect("clicked", app.on_refresh_clicked)

    # Menu button
    app.menu_btn = Gtk.MenuButton(icon_name="open-menu-symbolic")
    app.menu_btn.set_tooltip_text("Menu")

    # ── View stack ─────────────────────────────────────────────
    view_stack = Adw.ViewStack()
    view_stack.set_vexpand(True)
    app.view_stack = view_stack

    # ── Pages ──────────────────────────────────────────────────

    # Dashboard
    dashboard_page = _build_dashboard_page(app)
    view_stack.add_titled_with_icon(
        dashboard_page, "dashboard", "Dashboard",
        "utilities-system-monitor-symbolic"
    )

    # Profiles
    profiles_page = _build_profiles_page(app)
    view_stack.add_titled_with_icon(
        profiles_page, "profiles", "Profiles", "bookmarks-symbolic"
    )

    # Power
    power_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "power"]
    timing_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "timing"]
    power_page = _build_slider_page(
        app, "Power", "battery-symbolic", "power",
        [
            ("Power Limits", "STAPM and PPT power envelope — values in mW, shown in W", power_params),
            ("Time Constants", "STAPM and Slow PPT averaging windows (seconds) — (Enthusiast Mode Only)", timing_params)
        ]
    )
    view_stack.add_titled_with_icon(
        power_page, "power", "Power", "battery-symbolic"
    )

    # Clocks
    clocks_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "clocks"]
    clocks_page = _build_slider_page(
        app, "Clocks", "system-run-symbolic", "clocks",
        [("Clockspeed Limits", "Manual overclock limits and engine frequency boundaries (MHz)", clocks_params)]
    )
    view_stack.add_titled_with_icon(
        clocks_page, "clocks", "Clocks", "system-run-symbolic"
    )

    # Current
    current_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "current"]
    current_page = _build_slider_page(
        app, "Current", "thunderbolt-symbolic", "current",
        [("Current Limits", "TDC and EDC current envelope — values in mA, shown in A", current_params)]
    )
    view_stack.add_titled_with_icon(
        current_page, "current", "Current", "thunderbolt-symbolic"
    )

    # Thermal
    thermal_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "thermal"]
    thermal_page = _build_slider_page(
        app, "Thermal", "sensors-temperature-symbolic", "thermal",
        [("Temperature Limits", "CPU and skin temperature ceilings (°C)", thermal_params)]
    )
    view_stack.add_titled_with_icon(
        thermal_page, "thermal", "Thermal", "sensors-temperature-symbolic"
    )

    # Undervolt
    undervolt_params = [m for m in ryzen.SETTINGS_PARAMS if m["category"] == "undervolt"]
    co_global = [m for m in undervolt_params if m["param"] in ("set-coall", "set-cogfx")]
    co_per_core = [m for m in undervolt_params if m["param"].startswith("set-coper-")]
    
    undervolt_page = _build_slider_page(
        app, "Undervolt", "cpu-symbolic", "undervolt",
        [
            ("Global Curve Optimizer", "All-core and integrated GPU offset (negative for undervolt, positive for overvolt)", co_global),
            ("Per Core Curve Optimizer", "Individual CPU core offsets", co_per_core)
        ]
    )
    view_stack.add_titled_with_icon(
        undervolt_page, "undervolt", "Undervolt", "cpu-symbolic"
    )


    # Timing page merged into Power section

    # ── Split View (Sidebar navigation GNOME/Nautilus style) ──
    split_view = Adw.OverlaySplitView()
    split_view.set_sidebar_position(Gtk.PackType.START)
    split_view.set_min_sidebar_width(180)
    split_view.set_max_sidebar_width(240)
    split_view.set_sidebar_width_fraction(0.20)
    split_view.set_show_sidebar(True)

    # Sidebar Box
    sidebar_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    sidebar_box.add_css_class("sidebar-pane")
    sidebar_header = Adw.HeaderBar()
    sidebar_header.add_css_class("sidebar-header")
    sidebar_header.set_show_end_title_buttons(False)

    sidebar_title = Gtk.Label(label="Ryzenadj-gtk")
    sidebar_title.add_css_class("title")
    sidebar_title.add_css_class("bold")
    sidebar_header.set_title_widget(sidebar_title)
    sidebar_header.pack_end(app.menu_btn)
    sidebar_box.append(sidebar_header)

    sidebar_navigation = Adw.ViewSwitcherSidebar()
    sidebar_navigation.add_css_class("navigation-sidebar")
    sidebar_navigation.set_stack(view_stack)

    sidebar_scrolled = Gtk.ScrolledWindow()
    sidebar_scrolled.set_vexpand(True)
    sidebar_scrolled.set_child(sidebar_navigation)
    sidebar_box.append(sidebar_scrolled)

    split_view.set_sidebar(sidebar_box)

    # Main Content Area
    content_toolbar_view = Adw.ToolbarView()
    content_header = Adw.HeaderBar()
    content_header.add_css_class("main-header")

    # Sidebar toggle button
    app.btn_sidebar = Gtk.ToggleButton(icon_name="sidebar-show-symbolic")
    app.btn_sidebar.set_active(True)
    app.btn_sidebar.set_tooltip_text("Toggle Sidebar")
    app.btn_sidebar.connect("toggled", lambda b: split_view.set_show_sidebar(b.get_active()))
    content_header.pack_start(app.btn_sidebar)

    # Dynamically bind toggle button to split view sidebar visibility
    split_view.bind_property("show-sidebar", app.btn_sidebar, "active", GObject.BindingFlags.BIDIRECTIONAL)

    # Header Window Title (updates dynamically on page change)
    app.window_title = Adw.WindowTitle()
    app.window_title.set_title("Dashboard")
    app.window_title.set_subtitle(get_cpu_name())
    content_header.set_title_widget(app.window_title)

    def update_header_title(stack, _paramspec):
        child = stack.get_visible_child()
        if child:
            title = ""
            if hasattr(child, "get_title"):
                title = child.get_title()
            elif isinstance(child, Gtk.ScrolledWindow) and child.get_name() == "dashboard":
                title = "Dashboard"
            app.window_title.set_title(title)
    view_stack.connect("notify::visible-child", update_header_title)

    content_header.pack_end(app.btn_refresh)
    content_toolbar_view.add_top_bar(content_header)

    content_toolbar_view.set_content(view_stack)

    # Bottom Presets & Apply row (using native Gtk.ActionBar)
    action_bar = Gtk.ActionBar()
    action_bar.add_css_class("preset-row")

    btn_ps = Gtk.Button(label="⚡ Power Saving")
    btn_ps.add_css_class("preset-btn")
    btn_ps.add_css_class("btn-power-saving")
    btn_ps.set_tooltip_text("Apply ryzenadj --power-saving preset")
    btn_ps.connect("clicked", app.on_power_saving_clicked)

    btn_mp = Gtk.Button(label="🚀 Max Performance")
    btn_mp.add_css_class("preset-btn")
    btn_mp.add_css_class("btn-max-performance")
    btn_mp.set_tooltip_text("Apply ryzenadj --max-performance preset")
    btn_mp.connect("clicked", app.on_max_performance_clicked)

    btn_apply = Gtk.Button(label="Apply Settings")
    btn_apply.add_css_class("apply-btn")
    btn_apply.set_tooltip_text("Write slider values to hardware (Ctrl+S)")
    btn_apply.connect("clicked", app.on_apply_clicked)
    app.btn_apply = btn_apply

    # Pack in Gtk.ActionBar
    action_bar.pack_start(btn_ps)
    action_bar.pack_start(btn_mp)
    action_bar.pack_end(btn_apply)

    content_toolbar_view.add_bottom_bar(action_bar)
    split_view.set_content(content_toolbar_view)

    toast_overlay = Adw.ToastOverlay()
    toast_overlay.set_child(split_view)
    win.set_content(toast_overlay)
    app.toast_overlay = toast_overlay

    # ── App menu ────────────────────────────────────────────────
    from gi.repository import Gio
    gmenu = Gio.Menu.new()
    
    # Theme Menu
    theme_menu = Gio.Menu.new()
    theme_menu.append("Adwaita Default", "app.theme-color::default")
    theme_menu.append("Ryzen Red", "app.theme-color::ryzen")
    theme_menu.append("DLSS Green", "app.theme-color::geforce")
    theme_menu.append("14nm+++ Blue", "app.theme-color::intel")
    theme_menu.append("Archbtw Blue", "app.theme-color::arch")
    theme_menu.append("Saints Purple", "app.theme-color::saints")
    theme_menu.append("Noctua Brown", "app.theme-color::noctua")

    section_theme = Gio.Menu.new()
    section_theme.append_submenu("Accent Color", theme_menu)
    gmenu.append_section(None, section_theme)

    section1 = Gio.Menu.new()
    section1.append("Refresh from Hardware", "app.reload")
    gmenu.append_section(None, section1)

    section2 = Gio.Menu.new()
    section2.append("About Ryzenadj-gtk", "app.about")
    gmenu.append_section(None, section2)

    app.menu_btn.set_menu_model(gmenu)

    return win
