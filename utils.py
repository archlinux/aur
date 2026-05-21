import os
import json
import re

CSS = """
.user-bubble {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
    border-radius: 18px 18px 4px 18px;
    padding: 12px 16px;
    margin: 6px 20px 6px 80px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.assistant-bubble {
    background-color: @view_bg_color;
    color: @window_fg_color;
    border-radius: 18px 18px 18px 4px;
    padding: 12px 16px;
    margin: 6px 80px 6px 20px;
    border: 1px solid alpha(@window_fg_color, 0.05);
}

/* Modern Headerbar and Menus */
headerbar {
    padding: 6px 12px;
    background-color: transparent;
    border-bottom: 1px solid alpha(@window_fg_color, 0.08);
}

popover contents {
    padding: 8px;
    border-radius: 20px;
    background-color: @window_bg_color;
    box-shadow: 0 8px 24px rgba(0,0,0,0.2);
}

popover list {
    background-color: transparent;
}

popover row {
    padding: 8px 12px;
    border-radius: 12px;
    margin: 2px 0;
}

popover row:hover {
    background-color: alpha(@window_fg_color, 0.05);
}

/* Base styles for all elements */
.accent-btn {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
    border-radius: 12px;
    border: none;
    padding: 6px 16px;
}

.accent-btn:hover {
    background-color: shade(@accent_bg_color, 1.1);
}

.accent-btn:active {
    background-color: shade(@accent_bg_color, 0.9);
}

/* Force dialog suggested buttons to use our theme accent */
button.suggested-action {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
}

button.suggested-action:hover {
    background-color: shade(@accent_bg_color, 1.1);
}

.rounded-image {
    border-radius: 12px;
}

progressbar.suggested-action > trough > progress {
    background-color: @accent_bg_color;
    border-radius: 10px;
}

.chat-scroll {
    background-color: @window_bg_color;
}

.input-area {
    padding: 16px 24px;
    background-color: transparent;
}

.input-view {
    border-radius: 24px;
    padding: 8px 16px;
    background-color: @view_bg_color;
    border: 1px solid alpha(@window_fg_color, 0.1);
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.uninstalled-model-label {
    opacity: 0.5;
}

.installed-model-label {
    font-weight: 500;
}

.sidebar-title {
    font-weight: 600;
    font-size: 0.95em;
}

.sidebar-subtitle {
    opacity: 0.7;
    font-size: 0.85em;
}

.sidebar-list {
    background-color: @window_bg_color;
    border-right: 1px solid @borders;
}

.sidebar-list list {
    background-color: transparent;
}

.sidebar-list row {
    border-radius: 12px;
    margin: 2px 8px;
    transition: all 200ms ease;
}

.sidebar-list row:hover {
    background-color: alpha(@window_fg_color, 0.05);
}

.sidebar-list row:selected {
    background-color: alpha(@accent_bg_color, 0.2);
    color: @accent_bg_color;
}

.sidebar-list row:selected .sidebar-title,
.sidebar-list row:selected .sidebar-subtitle {
    color: @accent_bg_color;
}

.delete-btn {
    opacity: 0;
    transition: opacity 200ms ease;
}

row:hover .delete-btn {
    opacity: 0.6;
}

.delete-btn:hover {
    opacity: 1;
    color: @error_color;
}

.dim-label {
    opacity: 0.6;
    font-size: 0.9em;
    font-style: italic;
}

.system-status {
    font-weight: 500;
    font-size: 0.9em;
    padding: 8px;
}

.code-block {
    font-family: 'monospace';
    background-color: @view_bg_color;
    border: 1px solid alpha(@window_fg_color, 0.1);
    border-radius: 8px;
    padding: 8px;
}
"""

def markdown_to_pango(text: str) -> str:
    text = text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', text)
    return text
