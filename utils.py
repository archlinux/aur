import os
import json
import re

CSS = """
.user-bubble {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
    border-radius: 12px;
    padding: 10px 14px;
    margin: 5px 20px 5px 60px;
}

.assistant-bubble {
    background-color: #000000;
    color: @window_fg_color;
    border-radius: 12px;
    padding: 10px 14px;
    margin: 5px 60px 5px 20px;
}

progressbar.suggested-action > trough > progress {
    background-color: @accent_bg_color;
}

.chat-scroll {
    border-bottom: 1px solid @borders;
}

.input-area {
    padding: 12px;
    background-color: @window_bg_color;
}

.input-view {
    border-radius: 8px;
    padding: 8px;
    background-color: @view_bg_color;
}

.uninstalled-model-label {
    color: #808080;
}

.installed-model-label {
    color: #ffffff;
    font-weight: bold;
}

.code-block {
    font-family: monospace;
    background-color: #1e1e1e;
    color: #dcdcdc;
    padding: 4px;
}

.sidebar-title {
    font-weight: bold;
    font-size: 0.9em;
}

.sidebar-subtitle {
    color: grey;
    font-size: 0.8em;
}

.sidebar-list {
    background-color: alpha(@window_bg_color, 0.2);
}

.delete-btn {
    opacity: 0.3;
}

.delete-btn:hover {
    opacity: 1.0;
    color: @error_color;
}
"""

def markdown_to_pango(text: str) -> str:
    text = text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', text)
    text = re.sub(r'```(.*?)\n?(.*?)```', r'\n<span font_family="monospace" background="#1e1e1e" color="#dcdcdc">\2</span>\n', text, flags=re.DOTALL)
    text = re.sub(r'`(.*?)`', r'<span font_family="monospace" background="#1e1e1e" color="#dcdcdc">\1</span>', text)
    return text
