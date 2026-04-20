import gi
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk, Gdk, GLib
css_provider = Gtk.CssProvider()
css_provider.load_from_data(b"""
.toast-container {
    background-color: alpha(#1e1e1e, 0.95);
    color: #ffffff;
    border-radius: 12px;
    /* Removed static margin here so Python can animate it */
    padding: 0px; 
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
    border: 1px solid alpha(#ffffff, 0.1);
    min-width: 300px;
    min-height: 50px;
}

.toast-content {
    padding: 12px 16px;
}

.accent-strip {
    min-width: 6px;
    border-top-left-radius: 12px;
    border-bottom-left-radius: 12px;
}

.accent-green { background-color: #2ecc71; }
.accent-red { background-color: #e74c3c; }

.toast-label {
    font-size: 14px;
    font-weight: 500;
}
""")

display = Gdk.Display.get_default()
if display:
    Gtk.StyleContext.add_provider_for_display(
        display,
        css_provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
    )

class ToastBox(Gtk.Box):
    def __init__(self, message, duration=3000, color="green_toast"):
        super().__init__(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
        self.add_css_class("toast-container")
        self.set_halign(Gtk.Align.CENTER)
        self.set_valign(Gtk.Align.END)
        
        accent = Gtk.Box()
        accent.add_css_class("accent-strip")
        if color == "red_toast":
            accent.add_css_class("accent-red")
            icon_name = "xsi-dialog-error-symbolic"
        else:
            accent.add_css_class("accent-green")
            icon_name = "xsi-emblem-ok-symbolic"
        self.append(accent)

        content_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        content_box.add_css_class("toast-content")
        icon = Gtk.Image.new_from_icon_name(icon_name)
        icon.set_pixel_size(20)
        content_box.append(icon)
        label = Gtk.Label(label=message)
        label.set_wrap(True)
        label.set_max_width_chars(40)
        label.set_xalign(0)
        label.add_css_class("toast-label")
        content_box.append(label)
        self.append(content_box)

        self.set_opacity(0.0)
        self.set_margin_bottom(0) 
        
        self.target_margin = 30
        self.current_margin = 0.0
        self.current_opacity = 0.0
        
        GLib.timeout_add(16, self._animate_in)

        GLib.timeout_add(duration, self._start_exit_animation)

    def _animate_in(self):
        """Smooth ease-out animation for pop-up effect."""
        margin_diff = self.target_margin - self.current_margin
        opacity_diff = 1.0 - self.current_opacity

        if margin_diff < 0.5 and opacity_diff < 0.05:
            self.set_margin_bottom(self.target_margin)
            self.set_opacity(1.0)
            return False

        self.current_margin += margin_diff * 0.2
        self.current_opacity += opacity_diff * 0.2

        self.set_margin_bottom(int(self.current_margin))
        self.set_opacity(self.current_opacity)
        return True

    def _start_exit_animation(self):
        """Trigger the exit animation loop."""
        GLib.timeout_add(16, self._animate_out)
        return False

    def _animate_out(self):
        """Reverse animation to fade out and slide down."""
        if self.current_opacity <= 0.05:
            self._remove_self()
            return False

        self.current_opacity -= 0.1
        self.current_margin -= 1.0
        
        self.set_opacity(max(0.0, self.current_opacity))
        self.set_margin_bottom(int(self.current_margin))
        return True

    def _remove_self(self):
        parent = self.get_parent()
        if isinstance(parent, Gtk.Overlay):
            parent.remove_overlay(self)
        return False
