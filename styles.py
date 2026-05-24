"""
CSS styles for ryzenadj-gtk
Polished GNOME/Adwaita styling for Ryzenadj-gtk.
"""

CSS = """
/* ─── Window & Background ─────────────────────────────────── */
window.ryzenadj-win {
    background-color: @window_bg_color;
}

/* ─── Header bar premium aesthetics ───────────────────────── */
.main-header {
    background-color: transparent;
    box-shadow: none;
    border-bottom: none;
}

.sidebar-header {
    background-color: transparent;
    box-shadow: none;
    border-bottom: none;
}

.header-cpu-label {
    font-size: 11px;
    font-weight: 800;
    color: alpha(@window_fg_color, 0.45);
    letter-spacing: 0.8px;
    text-transform: uppercase;
}

/* ─── Dashboard Flat Aesthetics ────────────────────────────── */
.dashboard-hero-group list,
.dashboard-hero-group listbox,
.dashboard-hero-group .boxed-list {
    background-color: transparent;
    border: none;
    box-shadow: none;
}

.dashboard-hero-group row,
.dashboard-hero-group listboxrow {
    background-color: transparent;
    border: none;
    box-shadow: none;
    padding: 0;
    margin: 0;
}

.dashboard-group list,
.dashboard-group listbox,
.dashboard-group .boxed-list {
    background-color: transparent;
    border: none;
    box-shadow: none;
}

.dashboard-group row,
.dashboard-group listboxrow {
    background-color: transparent;
    border: none;
    box-shadow: none;
    padding: 0;
}

/* ─── Dashboard Hero Banner (Ultra-Modern Overhaul) ───────── */
.hero-box {
    padding: 24px;
    margin-bottom: 16px;
    background: radial-gradient(circle at top center, alpha(@accent_bg_color, 0.18) 0%, alpha(@accent_bg_color, 0.05) 40%, transparent 100%);
    border-radius: 20px;
    border: 1px solid alpha(@accent_bg_color, 0.15);
}

.hero-title-box {
    margin-left: 16px;
}

.hero-icon {
    color: @accent_bg_color;
    -gtk-icon-shadow: 0 0 20px alpha(@accent_bg_color, 0.5);
}

.hero-title {
    font-size: 30px;
    font-weight: 1000;
    letter-spacing: -1.2px;
    color: @window_fg_color;
    text-shadow: 0 2px 4px alpha(black, 0.15);
}

.hero-subtitle {
    font-size: 13px;
    font-weight: 700;
    color: alpha(@window_fg_color, 0.45);
}

.hero-cpu-badge {
    background-color: alpha(@accent_bg_color, 0.1);
    color: @accent_bg_color;
    border: 1px solid alpha(@accent_bg_color, 0.25);
    border-radius: 8px;
    padding: 2px 10px;
    font-weight: 900;
    font-size: 11px;
    margin-left: 8px;
}

@keyframes status-pulse {
    0% {
        background-color: alpha(#30d158, 0.2);
        border-color: alpha(#30d158, 0.4);
    }
    50% {
        background-color: alpha(#30d158, 0.4);
        border-color: alpha(#30d158, 0.8);
    }
    100% {
        background-color: alpha(#30d158, 0.2);
        border-color: alpha(#30d158, 0.4);
    }
}

.live-status-pill {
    background-color: alpha(#30d158, 0.2);
    color: #30d158;
    border: 1px solid alpha(#30d158, 0.4);
    border-radius: 12px;
    padding: 4px 12px;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}

/* ─── Category section headers (Ptyxis Pro) ──────────────── */
.section-title-box {
    margin-top: 24px;
    margin-bottom: 12px;
    padding: 0 4px;
}

.section-title-label {
    font-size: 15px;
    font-weight: bold;
    color: @window_fg_color;
}

.category-icon {
    color: @accent_bg_color;
    margin-right: 8px;
    -gtk-icon-size: 18px;
}

/* ─── Premium Monitor Cards (Glassy Pro Overhaul) ────────── */
.monitor-card {
    background-color: alpha(@window_fg_color, 0.03);
    background-image: linear-gradient(145deg, alpha(@window_fg_color, 0.02), transparent);
    border: 1px solid alpha(@window_fg_color, 0.08);
    border-radius: 18px;
    padding: 16px;
    transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    box-shadow: 0 2px 4px alpha(black, 0.03);
}

.monitor-card:hover {
    background-color: alpha(@window_fg_color, 0.06);
    border-color: alpha(@accent_bg_color, 0.35);
    transform: translateY(-3px);
    box-shadow: 0 8px 16px alpha(black, 0.08);
}

.monitor-name-label {
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    color: alpha(@window_fg_color, 0.45);
}

.monitor-limit-badge {
    font-size: 9.5px;
    font-weight: bold;
    color: @accent_bg_color;
    background-color: alpha(@accent_bg_color, 0.1);
    border: 1px solid alpha(@accent_bg_color, 0.2);
    border-radius: 8px;
    padding: 2px 6px;
}

.monitor-limit-badge.bottleneck {
    background-color: alpha(#ff3b30, 0.2);
    color: #ff3b30;
    border-color: alpha(#ff3b30, 0.5);
    animation: status-pulse 2s infinite cubic-bezier(0.4, 0, 0.2, 1);
}

.monitor-value-label {
    font-size: 24px;
    font-weight: 900;
    color: @accent_bg_color;
    font-variant-numeric: tabular-nums;
}

.monitor-unit-label {
    font-size: 12px;
    font-weight: bold;
    color: alpha(@window_fg_color, 0.4);
    margin-bottom: 3px;
}

.monitor-icon {
    color: alpha(@window_fg_color, 0.4);
    margin-right: 6px;
    -gtk-icon-size: 16px;
}

/* ─── Usage level bars (Ultra-Soft Style) ────────────────── */
progressbar.usage-bar {
    min-height: 8px;
    margin-top: 8px;
    margin-bottom: 4px;
}

progressbar.usage-bar trough {
    border-radius: 4px;
    background-color: alpha(@window_fg_color, 0.06);
    min-height: 8px;
    border: none;
}

progressbar.usage-bar progress {
    border-radius: 4px;
    min-height: 8px;
    border: none;
    transition: background-color 0.4s ease;
}

progressbar.usage-bar.low progress {
    background-color: #30d158;
    box-shadow: 0 0 12px alpha(#30d158, 0.3);
}

progressbar.usage-bar.medium progress {
    background-color: #ffd60a;
    box-shadow: 0 0 12px alpha(#ffd60a, 0.3);
}

progressbar.usage-bar.high progress {
    background-color: #ff453a;
    box-shadow: 0 0 12px alpha(#ff453a, 0.3);
}

progressbar.usage-bar.bottleneck progress {
    background-color: #ff3b30;
    box-shadow: 0 0 20px alpha(#ff3b30, 0.7);
}

/* ─── Slider rows (Setting Pages) ─────────────────────────── */
.slider-row-item {
    border-radius: 16px;
    margin: 4px 0;
    padding: 4px;
    transition: background-color 0.2s ease;
}

.slider-row-item:hover {
    background-color: alpha(@window_fg_color, 0.03);
}

.live-badge {
    background-color: alpha(#30d158, 0.15);
    color: #30d158;
    border: 1px solid alpha(#30d158, 0.3);
    border-radius: 16px;
    padding: 6px 14px;
    font-size: 12px;
    font-weight: 900;
    font-variant-numeric: tabular-nums;
}

.target-badge {
    background-color: alpha(@accent_bg_color, 0.12);
    color: @accent_bg_color;
    border: 1px solid alpha(@accent_bg_color, 0.3);
    border-radius: 16px;
    padding: 6px 14px;
    font-size: 12px;
    font-weight: 900;
    font-variant-numeric: tabular-nums;
}

.cpu-badge {
    background-color: @cpu_badge_bg;
    color: @cpu_badge_fg;
    border: 1px solid alpha(@cpu_badge_fg, 0.4);
    border-radius: 10px;
    padding: 4px 10px;
    font-size: 11px;
    font-weight: 900;
}

.gpu-badge {
    background-color: @gpu_badge_bg;
    color: @gpu_badge_fg;
    border: 1px solid alpha(@gpu_badge_fg, 0.4);
    border-radius: 10px;
    padding: 4px 10px;
    font-size: 11px;
    font-weight: 900;
}

/* ─── Preset buttons (Floating Action Feel) ───────────────── */
.preset-row {
    padding: 16px 24px;
    background-color: transparent;
    border: none;
}

.preset-btn {
    border-radius: 28px;
    padding: 10px 28px;
    font-weight: 900;
    font-size: 15px;
    transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    min-height: 48px;
    border: 1px solid transparent;
}

.preset-btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px alpha(black, 0.2);
}

.btn-power-saving {
    background-color: alpha(#30d158, 0.18);
    color: #30d158;
    border-color: alpha(#30d158, 0.4);
}

.btn-max-performance {
    background-color: alpha(#ff453a, 0.18);
    color: #ff453a;
    border-color: alpha(#ff453a, 0.4);
}

/* ─── Apply button (High Impact) ──────────────────────────── */
.apply-btn {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
    border-radius: 28px;
    padding: 10px 40px;
    font-weight: 900;
    font-size: 15px;
    min-height: 48px;
    transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    box-shadow: 0 6px 16px alpha(@accent_bg_color, 0.35);
}

.apply-btn:hover {
    background-color: shade(@accent_bg_color, 1.25);
    transform: translateY(-4px);
    box-shadow: 0 12px 28px alpha(@accent_bg_color, 0.5);
}

/* ─── Navigation & Sidebar (Ptyxis Style) ────────────────── */
.sidebar-pane {
    background-color: @sidebar_bg_color;
    border-right: 1px solid alpha(@window_fg_color, 0.05);
}

.navigation-sidebar row {
    border-radius: 10px;
    margin: 2px 8px;
    padding: 8px 12px;
    transition: all 0.2s ease;
}

.navigation-sidebar row image {
    -gtk-icon-size: 20px;
    margin-right: 10px;
    color: inherit;
    opacity: 0.7;
    transition: all 0.2s ease;
}

.navigation-sidebar row label {
    font-size: 14px;
    font-weight: 700;
    transition: all 0.2s ease;
}

.navigation-sidebar row:hover {
    background-color: alpha(@window_fg_color, 0.05);
}

.navigation-sidebar row:selected {
    background-color: alpha(@accent_bg_color, 0.12);
    color: @accent_bg_color;
}

.navigation-sidebar row:selected image {
    color: @accent_bg_color;
    opacity: 1.0;
}

/* ─── Diagnostics Warning Banner ─────────────────────────── */
.diagnostic-warning-row {
    background-color: alpha(#e01b24, 0.12);
    border: 1px solid alpha(#e01b24, 0.35);
    border-radius: 12px;
    padding: 16px;
    margin: 8px 0;
    transition: all 0.3s ease;
}

.diagnostic-warning-row label.title {
    color: #e01b24;
    font-weight: 800;
    font-size: 16px;
}

.diagnostic-warning-row label.subtitle {
    color: alpha(@window_fg_color, 0.8);
    font-size: 13px;
    margin-top: 4px;
}
"""
