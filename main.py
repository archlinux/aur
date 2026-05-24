"""
main.py - RyzenadjApp application class for ryzenadj-gtk
Handles: app lifecycle, actions, refresh timer, apply logic, about dialog.
"""
import sys
import os
import logging
import threading
import init_gi

import gi
from gi.repository import Gtk, Adw, Gdk, Gio, GLib

import ryzen
import styles
import ui as ui_module

logging.basicConfig(level=logging.INFO)
log = logging.getLogger(__name__)

APP_ID    = "com.marley.ryzenadj-gtk"
APP_NAME  = "Ryzenadj-gtk"
APP_VER   = "1.0.0"
REFRESH_INTERVAL_MS = 1000  # 1 s auto-refresh


class RyzenadjApp(Adw.Application):
    def __init__(self):
        super().__init__(
            application_id=APP_ID,
            flags=Gio.ApplicationFlags.FLAGS_NONE,
        )
        self.win = None
        self.css_provider = Gtk.CssProvider()
        self.theme_css_provider = Gtk.CssProvider()
        self.current_info: dict = {}
        self.pending_settings: dict = {}
        self._slider_rows: dict = {}
        self._dashboard_cards: list = []
        self.cpu_family: str = "Ryzen Processor"
        self._refresh_timer_id: int | None = None
        self._refreshing: bool = False
        self.enthusiast_mode: bool = False
        self.applied_settings: dict = {}
        self.ui_settings: dict = {
            "theme": "default",
            "auto_switch": False,
            "ac_profile": "",
            "battery_profile": "",
            "persistence_enabled": False,
            "persistence_interval": 30
        }
        self._persistence_ticks: int = 0
        self.last_ac_state: bool | None = None
        self.dbus_system_connection = None
        self.btn_refresh = None          # set by build_main_window
        self.window_title = None         # set by build_main_window
        self.supported_params: set = set()
        self._auth_granted: bool | None = None  # None=pending, True=ok, False=denied
        self._load_ui_settings()

    def _load_ui_settings(self):
        import json
        self.ui_config_path = os.path.expanduser("~/.config/ryzenadj-gtk/ui.json")
        if os.path.exists(self.ui_config_path):
            try:
                with open(self.ui_config_path, "r") as f:
                    self.ui_settings.update(json.load(f))
            except Exception as e:
                log.warning("Failed to load UI settings: %s", e)

    def _save_ui_settings(self):
        import json
        import os
        try:
            os.makedirs(os.path.dirname(self.ui_config_path), exist_ok=True)
            with open(self.ui_config_path, "w") as f:
                json.dump(self.ui_settings, f)
        except Exception as e:
            log.error(f"Failed to save UI settings: {e}")

    # ── Application lifecycle ──────────────────────────────────────────────────

    def do_activate(self) -> None:
        Adw.StyleManager.get_default().set_color_scheme(Adw.ColorScheme.PREFER_DARK)

        # Load standard CSS
        self.css_provider.load_from_data(styles.CSS)
        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            self.css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
        )
        
        # Load theme dynamic CSS provider (USER priority to override platform defaults)
        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            self.theme_css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_USER,
        )

        # Add local directory to icon theme search paths for local fallback running
        try:
            display = Gdk.Display.get_default()
            if display:
                theme = Gtk.IconTheme.get_for_display(display)
                curr_dir = os.path.dirname(os.path.abspath(__file__))
                theme.add_search_path(curr_dir)
        except Exception as e:
            log.debug("Failed to register local icon search path: %s", e)

        # Register actions
        self._register_actions()

        # Load saved pending settings
        saved = ryzen.load_settings()
        if saved:
            self.pending_settings.update(saved)
        self.applied_settings = dict(self.pending_settings)

        # Build and present window first
        self.win = ui_module.build_main_window(self)
        self.win.set_icon_name(APP_ID)

        GLib.set_prgname(APP_ID)
        GLib.set_application_name(APP_NAME)

        # ── Dependency Check ──
        if not ryzen.is_ryzenadj_installed():
            missing_page = ui_module.build_dependency_missing_page(self)
            self.win.set_content(missing_page)
            self.win.present()
            return

        self.win.present()

        # D-Bus Suspend/Resume listener subscription
        try:
            self.dbus_system_connection = Gio.bus_get_sync(Gio.BusType.SYSTEM, None)
            if self.dbus_system_connection:
                self.dbus_system_connection.signal_subscribe(
                    "org.freedesktop.login1",                  # sender
                    "org.freedesktop.login1.Manager",          # interface
                    "PrepareForSleep",                         # member
                    "/org/freedesktop/login1",                 # object path
                    None,                                      # arg0
                    Gio.DBusSignalFlags.NONE,
                    self.on_prepare_for_sleep                  # callback
                )
                log.info("Successfully subscribed to systemd PrepareForSleep D-Bus signal.")
        except Exception as e:
            log.warning("Failed to connect to System D-Bus for suspend/resume tracking: %s", e)

        # Async initial hardware data load
        self._do_initial_load_async()

        # Start auto-refresh
        self._start_refresh_timer()

    def _do_initial_load_async(self) -> None:
        """Fetch hardware data in a background thread after the window is shown.

        Runs a single ryzenadj -i call (via get_initial_data) using passwordless sudo,
        so the auth-required page is presented cleanly if the sudoers rules are not installed.
        """
        if self._refreshing:
            return
        self._refreshing = True

        def fetch():
            cpu_family, info, supported, auth_ok = ryzen.get_initial_data()
            GLib.idle_add(self._on_initial_load_done, cpu_family, info, supported, auth_ok)

        threading.Thread(target=fetch, daemon=True).start()

    def _sync_sliders_to_hardware_or_pending(self, info: dict, use_pending: bool = True) -> None:
        """Synchronize the position of all sliders with either pending settings or live hardware values."""
        for param, row in self._slider_rows.items():
            meta = getattr(row, "_param_meta", None)
            slider = getattr(row, "_slider", None)
            if not meta or not slider:
                continue
            
            is_supported = ryzen.is_parameter_supported(param, self.cpu_family, self.supported_params)
            
            if not is_supported:
                continue

            if use_pending and param in self.pending_settings:
                val = float(self.pending_settings[param])
            else:
                vkey = meta["value_key"]
                raw = info.get(vkey)
                if raw is not None:
                    div = meta["display_divisor"]
                    lo = meta["min"]
                    hi = meta["max"]
                    val = max(lo, min(hi, raw * div))
                else:
                    val = float(meta.get("default", meta["min"]))

            slider.set_value(val)

    def _on_initial_load_done(self, cpu_family: str, info: dict, supported: set, auth_ok: bool) -> bool:
        """GTK main-thread callback: populate UI or show auth-required page."""
        self._refreshing = False
        if not auth_ok:
            self._show_auth_required()
            return False
        self._auth_granted = True
        self.cpu_family = cpu_family
        self.current_info = info
        self.supported_params = supported

        # Update sensitivity and descriptions of all slider rows based on actual CPU support
        for param, row in self._slider_rows.items():
            meta = getattr(row, "_param_meta", None)
            desc_label = getattr(row, "_desc_label", None)
            if not meta or not desc_label:
                continue
            is_supported = ryzen.is_parameter_supported(param, self.cpu_family, self.supported_params)
            
            row.set_sensitive(is_supported)
            
            # Dynamically update the description text
            desc_text = meta["desc"]
            if not is_supported:
                desc_text = f"{desc_text} <span color='#e01b24' weight='bold' size='small'>(Unsupported on this CPU)</span>"
            desc_label.set_markup(f"<span style='italic' size='small'>{desc_text}</span>")

        # Initial synchronization of sliders to match saved settings or actual CPU values
        self._sync_sliders_to_hardware_or_pending(info, use_pending=True)
        self.applied_settings = dict(self.pending_settings)

        # Hide dashboard cards for unsupported metrics
        for card in self._dashboard_cards:
            val_key = getattr(card, "_val_key", None)
            visible = val_key in info if val_key else True
            card.set_visible(visible)
            parent = card.get_parent()
            if parent and isinstance(parent, Gtk.FlowBoxChild):
                parent.set_visible(visible)

        self._update_dashboard_cards()
        self._update_slider_badges()
        self._update_status_label()

        # Dynamically check system diagnostics for Secure Boot / Kernel Lockdown
        diag = ryzen.check_system_lockdown_status()
        if hasattr(self, "diagnostic_banner"):
            # Show banner if Secure Boot or Lockdown is active, AND the bypass driver is not loaded
            is_locked = (diag["secure_boot"] or diag["lockdown_active"]) and not diag["ryzen_smu_loaded"]
            self.diagnostic_banner.set_visible(is_locked)
            
            reasons = []
            if diag["secure_boot"]:
                reasons.append("Secure Boot is enabled")
            if diag["lockdown_active"]:
                reasons.append(f"Kernel Lockdown is active ({diag['lockdown_mode']})")
            if not diag["iomem_relaxed"]:
                reasons.append("'iomem=relaxed' is missing from kernel command line")
                
            subtitle = f"⚠️ {', '.join(reasons)}. ryzenadj is unable to read/write settings without the 'ryzen_smu' kernel driver. Please load 'ryzen_smu' or disable restrictions."
            self.diagnostic_banner.set_subtitle(subtitle)

        return False

    def _show_auth_required(self) -> None:
        """Replace window content with the auth-required status page."""
        self._auth_granted = False
        auth_page = ui_module.build_auth_required_page(self)
        self.win.set_content(auth_page)

    def _retry_auth(self) -> None:
        """Called by the Retry button on the auth-required page."""
        # Restore normal window content, then re-trigger the single pkexec call.
        self.win.set_content(self.toast_overlay)
        self._auth_granted = None
        self._do_initial_load_async()

    # ── Actions ────────────────────────────────────────────────────────────────

    def _register_actions(self) -> None:
        action_reload = Gio.SimpleAction.new("reload", None)
        action_reload.connect("activate", lambda a, p: self.on_refresh_clicked(None))
        self.add_action(action_reload)

        action_about = Gio.SimpleAction.new("about", None)
        action_about.connect("activate", self.on_about_activated)
        self.add_action(action_about)

        # Theme color stateful action
        initial_theme = self.ui_settings.get("theme", "default")
        action_theme = Gio.SimpleAction.new_stateful(
            "theme-color",
            GLib.VariantType.new("s"),
            GLib.Variant.new_string(initial_theme)
        )
        action_theme.connect("change-state", self.on_theme_color_changed)
        self.add_action(action_theme)
        
        # Apply initial theme
        self.on_theme_color_changed(action_theme, GLib.Variant.new_string(initial_theme))

        # Keyboard shortcuts
        self.set_accels_for_action("app.reload", ["F5"])

        action_apply = Gio.SimpleAction.new("apply", None)
        action_apply.connect("activate", lambda a, p: self.on_apply_clicked(None))
        self.add_action(action_apply)
        self.set_accels_for_action("app.apply", ["<Ctrl>s"])

    def on_theme_color_changed(self, action, state) -> None:
        action.set_state(state)
        color = state.get_string()
        
        # Save preference
        self.ui_settings["theme"] = color
        self._save_ui_settings()

        theme_palettes = {
            "default": {
                "accent": "@accent_bg_color",
                "cpu_fg": "#4cc9f0", "cpu_bg": "rgba(76, 201, 240, 0.12)",      # Luminous Teal
                "gpu_fg": "#f72585", "gpu_bg": "rgba(247, 37, 133, 0.12)",     # Cyberpunk Pink
            },
            "ryzen": {
                "accent": "#ff3b30",                                           # Luminous Red
                "cpu_fg": "#ffd60a", "cpu_bg": "rgba(255, 214, 10, 0.12)",     # Neon Gold
                "gpu_fg": "#30d158", "gpu_bg": "rgba(48, 209, 88, 0.12)",      # Vibrant Green
            },
            "geforce": {
                "accent": "#76ff03",                                           # Electric Lime
                "cpu_fg": "#00e5ff", "cpu_bg": "rgba(0, 229, 255, 0.12)",      # Cyan
                "gpu_fg": "#ff4081", "gpu_bg": "rgba(255, 64, 129, 0.12)",     # Bright Pink
            },
            "intel": {
                "accent": "#0071e3",                                           # Intel Luminous Blue
                "cpu_fg": "#ffea00", "cpu_bg": "rgba(255, 234, 0, 0.12)",      # Sun Yellow
                "gpu_fg": "#00ff41", "gpu_bg": "rgba(0, 255, 65, 0.12)",       # Matrix Green
            },
            "arch": {
                "accent": "#1793d1",                                           # Arch Blue
                "cpu_fg": "#bf5af2", "cpu_bg": "rgba(191, 90, 242, 0.12)",     # Luminous Purple
                "gpu_fg": "#ff9f0a", "gpu_bg": "rgba(255, 159, 10, 0.12)",     # Orange
            },
            "saints": {
                "accent": "#af52de",                                           # Saints Purple
                "cpu_fg": "#ff3700", "cpu_bg": "rgba(255, 55, 0, 0.12)",       # Hot Orange
                "gpu_fg": "#5eebff", "gpu_bg": "rgba(94, 235, 255, 0.12)",     # Sky Blue
            },
            "noctua": {
                "accent": "#9c6644",                                           # Noctua Brown (Vibrant)
                "cpu_fg": "#e63946", "cpu_bg": "rgba(230, 57, 70, 0.12)",      # Red
                "gpu_fg": "#a8dadc", "gpu_bg": "rgba(168, 218, 220, 0.12)",     # Pale Blue
            }
        }
        
        palette = theme_palettes.get(color, theme_palettes["default"])
        accent = palette["accent"]
        
        css_lines = []
        if color != "default":
            css_lines.append(f"@define-color accent_color {accent};")
            css_lines.append(f"@define-color accent_bg_color {accent};")
            css_lines.append(f"@define-color accent_fg_color #ffffff;")
            css_lines.append(f"@define-color suggested_bg_color {accent};")
            css_lines.append(f"@define-color suggested_fg_color #ffffff;")
            css_lines.append(f"@define-color selection_bg_color {accent};")
            css_lines.append(f"@define-color selection_fg_color #ffffff;")
            
            # Explicit overrides for buttons and entries to force them to use the accent
            css_lines.append(".suggested-action { background-color: @accent_bg_color; color: @accent_fg_color; }")
            css_lines.append("selection { background-color: @accent_bg_color; color: @accent_fg_color; }")
        
        # Inject dynamic CPU/GPU badge redefinitions
        css_lines.append(f"@define-color cpu_badge_fg {palette['cpu_fg']};")
        css_lines.append(f"@define-color cpu_badge_bg {palette['cpu_bg']};")
        css_lines.append(f"@define-color gpu_badge_fg {palette['gpu_fg']};")
        css_lines.append(f"@define-color gpu_badge_bg {palette['gpu_bg']};")
        
        css = "\n".join(css_lines)
        self.theme_css_provider.load_from_data(css)

    # ── Refresh ────────────────────────────────────────────────────────────────

    def _start_refresh_timer(self) -> None:
        self._refresh_timer_id = GLib.timeout_add(
            REFRESH_INTERVAL_MS, self._auto_refresh
        )

    def _auto_refresh(self) -> bool:
        """Called by GLib timer. Schedules a background fetch.

        Does nothing if auth has not been granted.
        """
        if self._auth_granted is not True:
            return True  # keep timer alive; fires again after retry succeeds
        
        # Monitor power source transition
        self._check_power_source()
        
        # Persistence Guard: periodically check and re-apply settings
        if self.ui_settings.get("persistence_enabled", False) and self.applied_settings:
            self._persistence_ticks += 1
            interval = int(self.ui_settings.get("persistence_interval", 30))
            if self._persistence_ticks >= interval:
                self._persistence_ticks = 0
                log.info("Persistence Guard: Verifying and re-applying settings: %s", self.applied_settings)
                def run_persistence():
                    ok, msg = ryzen.apply_settings(self.applied_settings, self.supported_params, self.cpu_family)
                    if not ok:
                        log.error("Persistence Guard: Failed to re-apply settings: %s", msg)
                threading.Thread(target=run_persistence, daemon=True).start()
        else:
            self._persistence_ticks = 0
        
        if not self._refreshing:
            self._do_refresh_async(force_sync_sliders=False)
        return True  # Keep timer alive

    def on_prepare_for_sleep(self, connection, sender_name, object_path, interface_name, signal_name, parameters, user_data):
        """D-Bus signal callback for system sleep and wake events."""
        try:
            is_about_to_sleep = parameters.get_child_value(0).get_boolean()
            if not is_about_to_sleep:
                log.info("System resumed from sleep. Triggering automatic hardware register restoration...")
                GLib.timeout_add(3000, self._restore_after_sleep)
        except Exception as e:
            log.error("Failed to parse PrepareForSleep parameters: %s", e)

    def _restore_after_sleep(self) -> bool:
        """Background handler to re-apply the last applied settings after waking up."""
        if not self.applied_settings:
            log.info("No active settings to restore after sleep.")
            return False
        
        log.info("Re-applying saved configuration to hardware: %s", self.applied_settings)
        def reapply():
            ok, msg = ryzen.apply_settings(self.applied_settings, self.supported_params, self.cpu_family)
            if ok:
                log.info("Successfully restored hardware registers after system sleep.")
                self._show_toast("Hardware settings automatically restored after sleep.", is_error=False)
            else:
                log.error("Failed to restore hardware registers: %s", msg)
                self._show_toast("Failed to restore hardware settings after sleep.", is_error=True)
                
        threading.Thread(target=reapply, daemon=True).start()
        return False

    def _check_power_source(self) -> None:
        """Query physical AC online state and trigger profile switching if state shifts."""
        current_ac = ryzen.is_on_ac_power()
        if self.last_ac_state is None:
            self.last_ac_state = current_ac
            return
            
        if current_ac != self.last_ac_state:
            self.last_ac_state = current_ac
            log.info("Power supply state changed: connected_to_ac=%s", current_ac)
            
            if self.ui_settings.get("auto_switch", False):
                self._apply_auto_power_profile(current_ac)

    def _apply_auto_power_profile(self, is_ac: bool) -> None:
        """Automatically load and apply the profile configured for the new power source."""
        profile_key = "ac_profile" if is_ac else "battery_profile"
        profile_name = self.ui_settings.get(profile_key, "")
        
        if not profile_name:
            log.info("No profile configured for %s automation.", "AC" if is_ac else "Battery")
            return
            
        profiles = ryzen.load_profiles()
        
        if profile_name == "__power_saving__":
            self._show_toast("AC disconnected. Swapping to 'Power Saving' preset...", is_error=False)
            self.on_power_saving_clicked(None)
        elif profile_name == "__max_performance__":
            self._show_toast("AC connected. Swapping to 'Max Performance' preset...", is_error=False)
            self.on_max_performance_clicked(None)
        elif profile_name in profiles:
            target_settings = profiles[profile_name]
            self._show_toast(f"Power source changed. Applying '{profile_name}' profile...", is_error=False)
            
            for param, val in target_settings.items():
                self.pending_settings[param] = val
                if param in self._slider_rows:
                    row_widget = self._slider_rows[param]
                    slider = getattr(row_widget, "_slider", None)
                    if slider:
                        slider.set_value(float(val))
            def run_write():
                ok, msg = ryzen.apply_settings(target_settings, self.supported_params, self.cpu_family)
                GLib.idle_add(self._on_apply_done, ok, msg, target_settings)
            threading.Thread(target=run_write, daemon=True).start()
        else:
            log.warning("Configured automation profile '%s' was not found in profiles database.", profile_name)

    def on_refresh_clicked(self, _btn) -> None:
        if self._refreshing:
            return
        # Spin the icon
        if self.btn_refresh:
            self.btn_refresh.set_sensitive(False)
        self._do_refresh_async(force_sync_sliders=True)

    def _do_refresh_async(self, force_sync_sliders: bool = False) -> None:
        self._refreshing = True

        def fetch():
            info = ryzen.get_current_info()
            GLib.idle_add(self._on_refresh_done, info, force_sync_sliders)

        t = threading.Thread(target=fetch, daemon=True)
        t.start()

    def _on_refresh_done(self, info: dict, force_sync_sliders: bool = False) -> bool:
        # Only update if we got real data — don't wipe good readings with an
        # empty result caused by a transient sudo -n failure.
        if info:
            self.current_info = info
            if force_sync_sliders:
                # Discard unsaved changes and reset sliders to the new live values
                self.pending_settings.clear()
                saved = ryzen.load_settings()
                if saved:
                    self.pending_settings.update(saved)
                self._sync_sliders_to_hardware_or_pending(info, use_pending=True)
                self.applied_settings = dict(self.pending_settings)

        self._refreshing = False

        if self.btn_refresh:
            self.btn_refresh.set_sensitive(True)

        self._update_dashboard_cards()
        self._update_slider_badges()
        self._update_status_label()
        return False  # GLib.idle_add

    def _update_dashboard_cards(self) -> None:
        for card in self._dashboard_cards:
            val_key = getattr(card, "_val_key", None)
            lim_key = getattr(card, "_lim_key", None)
            if not val_key:
                continue
            val   = self.current_info.get(val_key)
            limit = self.current_info.get(lim_key) if lim_key else None

            val_str = f"{val:.1f}" if val is not None else "—"
            card._val_lbl.set_text(val_str)

            if val is not None and limit and limit > 0:
                frac = min(1.0, val / limit)
            else:
                frac = 0.0

            # Update the limit badge dynamically
            if hasattr(card, "_lim_lbl") and card._lim_lbl:
                card._lim_lbl.remove_css_class("bottleneck")
                limit_str = ui_module._fmt_limit(limit, card._unit)
                if frac >= 0.95:
                    limit_str = f"⚠️ CAPPED ({limit_str.replace('Limit: ', '')})"
                    card._lim_lbl.add_css_class("bottleneck")
                card._lim_lbl.set_text(limit_str)

            bar = card._bar
            for cls in ("low", "medium", "high", "bottleneck"):
                bar.remove_css_class(cls)
            bar.add_css_class(ui_module._bar_class(frac))
            if frac >= 0.95:
                bar.add_css_class("bottleneck")
            bar.set_fraction(frac)

    def _update_slider_badges(self) -> None:
        for param, row in self._slider_rows.items():
            meta = getattr(row, "_param_meta", None)
            if not meta:
                continue
            vkey = meta["value_key"]
            raw  = self.current_info.get(vkey)
            if raw is not None:
                cur_text = ui_module._fmt(raw, 1, meta["display_unit"])
            else:
                cur_text = "—"
            badge = getattr(row, "_cur_badge", None)
            if badge:
                badge.set_text(f"Live: {cur_text}")

    def _update_status_label(self) -> None:
        # Update subtitle in header
        if self.window_title:
            self.window_title.set_subtitle(ui_module.get_cpu_name())

    # ── Apply ──────────────────────────────────────────────────────────────────

    def on_apply_clicked(self, _btn) -> None:
        # Determine exactly which settings have been modified since the last successful apply
        diff_settings = {}
        for k, v in self.pending_settings.items():
            if self.applied_settings.get(k) != v:
                diff_settings[k] = v

        if not diff_settings:
            self._show_toast("No changes to apply.", is_error=False)
            return

        # ── Safety Confirmation Dialog ──
        # Build a list of risky parameters to warn the user specifically
        risky_params = []
        for param in diff_settings:
            if param.startswith("set-co"):
                risky_params.append(f"Curve Optimizer ({param})")
            if param in ("oc-clk", "oc-volt"):
                risky_params.append(f"Manual Overclock ({param})")
        
        # Power limits over 100W are also considered risky
        for param, val in diff_settings.items():
            if param.endswith("-limit") and val > 100000:
                risky_params.append(f"High Power Limit ({param}: {val/1000:.1f}W)")

        msg = "Are you sure you want to apply these settings to hardware?"
        if risky_params:
            risky_list = "\n • ".join(risky_params)
            msg = f"<b>Risky settings detected:</b>\n • {risky_list}\n\nAggressive tuning may cause system instability or hardware stress. Continue?"

        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Apply Hardware Settings?",
            body=msg,
        )
        dialog.set_body_use_markup(True)
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("apply", "Apply")
        dialog.set_default_response("cancel")
        dialog.set_close_response("cancel")
        dialog.set_response_appearance("apply", Adw.ResponseAppearance.SUGGESTED)

        def on_response(d, response):
            if response == "apply":
                self._execute_apply(diff_settings)

        dialog.connect("response", on_response)
        dialog.present()

    def _execute_apply(self, diff_settings: dict) -> None:
        self.btn_apply.set_sensitive(False)
        self.btn_apply.set_label("Applying…")

        def do_apply():
            ok, msg = ryzen.apply_settings(diff_settings, self.supported_params, self.cpu_family)
            GLib.idle_add(self._on_apply_done, ok, msg, diff_settings)

        t = threading.Thread(target=do_apply, daemon=True)
        t.start()

    def _on_apply_done(self, ok: bool, msg: str, applied_diff: dict) -> bool:
        self.btn_apply.set_sensitive(True)
        self.btn_apply.set_label("Apply Settings")
        self._show_toast(msg, is_error=not ok)
        if ok:
            # Update local successfully-applied state tracking upon success
            self.applied_settings.update(applied_diff)
            # Refresh to reflect new state
            GLib.timeout_add(500, lambda: self._do_refresh_async(force_sync_sliders=False) or False)
        else:
            # Sync sliders and pending_settings back to actual hardware/saved values to clear poisoned/unsupported states
            GLib.timeout_add(500, lambda: self._do_refresh_async(force_sync_sliders=True) or False)
        return False

    # ── Presets ────────────────────────────────────────────────────────────────

    def on_power_saving_clicked(self, _btn) -> None:
        def go():
            ok, msg = ryzen.apply_preset("power-saving")
            GLib.idle_add(self._on_preset_done, ok, msg)
        threading.Thread(target=go, daemon=True).start()

    def on_max_performance_clicked(self, _btn) -> None:
        def go():
            ok, msg = ryzen.apply_preset("max-performance")
            GLib.idle_add(self._on_preset_done, ok, msg)
        threading.Thread(target=go, daemon=True).start()

    def _on_preset_done(self, ok: bool, msg: str) -> bool:
        self._show_toast(msg, is_error=not ok)
        if ok:
            GLib.timeout_add(500, lambda: self._do_refresh_async(force_sync_sliders=True) or False)
        return False

    # ── Startup Service Toggle ──────────────────────────────────────────────────

    def on_startup_switch_toggled(self, switch_row, _spec) -> None:
        if getattr(self, "_setting_service_switch", False):
            return
        active = switch_row.get_active()
        if active != ryzen.is_service_enabled():
            def run_toggle():
                ok, msg = ryzen.set_service_enabled(active)
                GLib.idle_add(self._on_startup_toggle_done, ok, msg, active)
            threading.Thread(target=run_toggle, daemon=True).start()

    def _on_startup_toggle_done(self, ok: bool, msg: str, active: bool) -> bool:
        self._show_toast(msg, is_error=not ok)
        if not ok:
            self._setting_service_switch = True
            if hasattr(self, "switch_startup"):
                self.switch_startup.set_active(not active)
            self._setting_service_switch = False
        return False

    # ── Factory Reset ──────────────────────────────────────────────────────────

    def on_factory_reset_clicked(self, _btn) -> None:
        dialog = Adw.MessageDialog(
            transient_for=self.win,
            heading="Factory Reset & Wipe?",
            body="This will:\n • Delete all saved settings\n • Disable the boot-apply service\n • Clear all overrides on the next reboot\n\nAre you sure you want to proceed?",
        )
        dialog.add_response("cancel", "Cancel")
        dialog.add_response("reset", "Reset Everything")
        dialog.set_default_response("cancel")
        dialog.set_close_response("cancel")
        dialog.set_response_appearance("reset", Adw.ResponseAppearance.DESTRUCTIVE)

        def on_response(d, response):
            if response == "reset":
                self._execute_factory_reset()

        dialog.connect("response", on_response)
        dialog.present()

    def _execute_factory_reset(self) -> None:
        ok, msg = ryzen.factory_reset()
        if ok:
            # Show a final confirmation to reboot now
            reboot_dialog = Adw.MessageDialog(
                transient_for=self.win,
                heading="Reset Complete",
                body="Settings have been wiped. A system reboot is required to clear current hardware registers and return to stock behavior.\n\nWould you like to reboot now?",
            )
            reboot_dialog.add_response("later", "Later")
            reboot_dialog.add_response("reboot", "Reboot Now")
            reboot_dialog.set_default_response("reboot")
            reboot_dialog.set_response_appearance("reboot", Adw.ResponseAppearance.SUGGESTED)

            def on_reboot_response(d, response):
                if response == "reboot":
                    os.system("reboot")
                else:
                    self.quit() # Exit app as it's now in a "wiped" state

            reboot_dialog.connect("response", on_reboot_response)
            reboot_dialog.present()
        else:
            self._show_toast(f"Reset failed: {msg}", is_error=True)

    # ── Enthusiast Mode Toggle ──────────────────────────────────────────────────

    def on_enthusiast_toggled(self, switch_row, _spec) -> None:
        active = switch_row.get_active()
        if self.enthusiast_mode == active:
            return
        self.enthusiast_mode = active
        
        # Extended limits definitions
        power_standard_max = 130000
        power_enthusiast_max = 250000  # 250W
        
        current_standard_max = 300000
        current_enthusiast_max = 500000  # 500A
        
        for param, row in self._slider_rows.items():
            meta = getattr(row, "_param_meta", None)
            if not meta:
                continue
            
            # Determine the new max range
            if meta["category"] == "power" or meta["param"] == "skin-temp-limit":
                new_max = power_enthusiast_max if active else power_standard_max
            elif meta["category"] == "current":
                if meta["param"] in ("vrm-current", "vrmmax-current"):
                    new_max = current_enthusiast_max if active else current_standard_max
                else:
                    new_max = 150000 if active else 100000
            else:
                continue
            
            # Update Adjustment bounds safely
            slider = getattr(row, "_slider", None)
            if slider:
                adj = slider.get_adjustment()
                val = adj.get_value()
                if not active and val > new_max:
                    adj.set_value(new_max)
                adj.set_upper(new_max)
                slider.set_tooltip_text(f"Range: {int(adj.get_lower())} – {new_max} {meta['unit']}")
                
                # Trigger callback to update target badge display with new bound
                slider.emit("value-changed")

        # Toggle Power Page Timing Constant groups dynamically
        if hasattr(self, "timing_preferences_group") and self.timing_preferences_group:
            self.timing_preferences_group.set_visible(active)
        if hasattr(self, "timing_preferences_header") and self.timing_preferences_header:
            self.timing_preferences_header.set_visible(active)

        if active:
            self._show_toast("Enthusiast Mode: Extreme limits unlocked up to 250W!", is_error=False)
        else:
            self._show_toast("Enthusiast Mode: Reset ranges back to standard bounds.", is_error=False)

    # ── Toast ──────────────────────────────────────────────────────────────────

    def _show_toast(self, msg: str, is_error: bool = False) -> None:
        if hasattr(self, "_current_toast") and self._current_toast:
            try:
                self._current_toast.dismiss()
            except Exception:
                pass
        prefix = "⚠ " if is_error else ""
        toast = Adw.Toast.new(f"{prefix}{msg}")
        toast.set_timeout(2)
        self._current_toast = toast
        if hasattr(self, "toast_overlay") and self.toast_overlay:
            self.toast_overlay.add_toast(toast)
        elif isinstance(self.win, Adw.ApplicationWindow):
            try:
                self.win.add_toast(toast)
            except AttributeError:
                log.warning("Adw.ApplicationWindow lacks add_toast, toast discarded: %s", msg)

    # ── About ──────────────────────────────────────────────────────────────────

    def on_about_activated(self, _action, _param) -> None:
        about = Adw.AboutDialog()
        about.set_application_name(APP_NAME)
        about.set_application_icon(APP_ID)
        about.set_version(APP_VER)
        about.set_developer_name("marley")
        about.set_website("https://github.com/marleylinux/Ryzenadj-gtk")
        about.set_issue_url("https://github.com/marleylinux/Ryzenadj-gtk/issues")
        about.set_license_type(Gtk.License.GPL_3_0)
        about.set_comments(
            "A modern GTK4 / Libadwaita graphical wrapper for ryzenadj.\n"
            "Adjust AMD Ryzen power management settings with ease."
        )
        about.set_developers(["marley"])
        about.present(self.win)
