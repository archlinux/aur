import os
import json
import re

CSS = """
/* chat bg */
.chat-scroll {
    background-color: @window_bg_color;
}

/* chat bubbles */
.user-bubble, .assistant-bubble {
    padding: 14px 18px;
    margin: 8px 12px;
    border: 1px solid transparent;
    box-shadow: 0 4px 14px alpha(@window_fg_color, 0.03), 0 1px 3px alpha(@window_fg_color, 0.01);
    transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.25s ease, border-color 0.25s ease;
}

.user-bubble {
    background-image: linear-gradient(to bottom right, @accent_bg_color, shade(@accent_bg_color, 0.88));
    color: @accent_fg_color;
    border-radius: 16px;
    border-bottom-right-radius: 4px;
}

.user-bubble:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 22px alpha(@accent_bg_color, 0.18), 0 2px 6px alpha(@accent_bg_color, 0.08);
}

.assistant-bubble {
    background-color: alpha(@window_fg_color, 0.03);
    color: @window_fg_color;
    border: 1px solid alpha(@window_fg_color, 0.08);
    border-radius: 16px;
    border-bottom-left-radius: 4px;
}

.assistant-bubble:hover {
    transform: translateY(-2px);
    background-color: alpha(@window_fg_color, 0.04);
    border-color: alpha(@window_fg_color, 0.12);
    box-shadow: 0 8px 22px alpha(@window_fg_color, 0.06), 0 2px 6px alpha(@window_fg_color, 0.02);
}

/* avatars */
.avatar-box {
    margin-top: 8px;
    min-width: 32px;
    min-height: 32px;
    border-radius: 50%;
    background-color: alpha(@window_fg_color, 0.06);
    color: alpha(@window_fg_color, 0.6);
    transition: background-color 0.2s ease;
    padding: 0;
}

.avatar-box.avatar-user {
    background-color: alpha(@accent_bg_color, 0.12);
    color: @accent_bg_color;
}

.avatar-box image {
    padding: 0;
    margin: 0;
}

/* bubble header */
.bubble-header {
    border-bottom: 1px solid alpha(@window_fg_color, 0.06);
    padding-bottom: 4px;
    margin-bottom: 8px;
}

.user-bubble .bubble-header {
    border-bottom-color: alpha(@accent_fg_color, 0.15);
}

.bubble-model-label {
    font-weight: bold;
    font-size: 11px;
    color: @accent_bg_color;
}

.bubble-user-label {
    font-weight: bold;
    font-size: 11px;
    color: alpha(@accent_fg_color, 0.75);
}

/* action buttons */
.bubble-action-btn {
    /* hide by default */
    opacity: 0.0;
    min-height: 24px;
    min-width: 24px;
    padding: 0;
    margin: 0;
    border-radius: 6px;
    transition: opacity 0.25s ease, background-color 0.2s ease, color 0.2s ease, transform 0.15s ease;
}

.bubble-action-btn image {
    color: alpha(@window_fg_color, 0.45);
    margin: 0;
    padding: 0;
    transition: color 0.2s ease;
}

/* fade on hover */
.user-bubble:hover .bubble-action-btn,
.assistant-bubble:hover .bubble-action-btn {
    opacity: 0.65;
}

.bubble-action-btn:hover {
    opacity: 1.0;
    background-color: alpha(@window_fg_color, 0.08);
    transform: scale(1.1);
}

.bubble-action-btn:hover image {
    color: @accent_bg_color;
}

.user-bubble .bubble-action-btn image {
    color: alpha(@accent_fg_color, 0.65);
}

.user-bubble .bubble-action-btn:hover {
    background-color: alpha(@accent_fg_color, 0.15);
}

.user-bubble .bubble-action-btn:hover image {
    color: @accent_fg_color;
}

/* sidebar */
.sidebar-list {
    background-color: @window_bg_color;
}

.boxed-list {
    margin: 12px;
    border-radius: 12px;
    border: 1px solid alpha(@window_fg_color, 0.1);
    background-color: @view_bg_color;
}

.boxed-list row {
    padding: 10px;
}

.boxed-list row:selected {
    background-color: alpha(@accent_bg_color, 0.2);
}

/* input area */
.input-area {
    padding: 12px 20px;
    background-color: @window_bg_color;
    border-top: 1px solid @borders;
}

.input-view {
    border-radius: 24px;
    padding: 6px 16px;
    background-color: alpha(@window_fg_color, 0.04);
    border: 1px solid alpha(@window_fg_color, 0.08);
    box-shadow: none;
    transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
}

.input-view:focus-within {
    border-color: @accent_bg_color;
    box-shadow: 0 0 0 3px alpha(@accent_bg_color, 0.15), 0 4px 12px alpha(@window_fg_color, 0.05);
    background-color: @view_bg_color;
}

.input-view textview {
    font-size: 13.5px;
    line-height: 1.45;
}

.input-view textview,
.input-view textview text,
.input-view textview border,
.input-view scrolledwindow {
    background-color: transparent;
    background-image: none;
    border-style: none;
    box-shadow: none;
}

textview.locked-entry text {
    color: alpha(@window_fg_color, 0.4);
    font-style: italic;
}

/* buttons */
.accent-btn, button.suggested-action {
    background-color: @accent_bg_color;
    color: @accent_fg_color;
    transition: background-color 0.2s ease, transform 0.2s ease, box-shadow 0.2s ease;
}

.accent-btn:hover, button.suggested-action:hover {
    background-color: shade(@accent_bg_color, 1.1);
    transform: scale(1.08);
    box-shadow: 0 2px 8px alpha(@accent_bg_color, 0.25);
}

.accent-btn:active, button.suggested-action:active {
    transform: scale(0.95);
}

/* circular buttons */
button.circular {
    min-width: 38px;
    min-height: 38px;
    border-radius: 50%;
    padding: 0;
}

button.circular image {
    margin: 0;
    padding: 0;
}

/* attachment btn */
.input-view button.flat {
    min-width: 32px;
    min-height: 32px;
    border-radius: 50%;
    padding: 0;
}

.input-view button.flat image {
    margin: 0;
    padding: 0;
}

/* code block */
.code-block {
    font-family: 'monospace';
    background-color: alpha(@window_fg_color, 0.05);
    border-radius: 8px;
    padding: 10px;
    margin: 4px 0;
}

/* attach hover */
.input-view button {
    color: @accent_bg_color;
    transition: color 0.2s ease;
}
.input-view button:disabled {
    color: alpha(@window_fg_color, 0.4);
}
.input-view button:hover {
    color: shade(@accent_bg_color, 1.2);
}

/* attach grid */
.rounded-image-thumbnail, .rounded-file-thumbnail {
    border-radius: 8px;
    border: 1px solid alpha(@window_fg_color, 0.15);
    background-color: @view_bg_color;
    padding: 2px;
}
.thumbnail-container {
    border-radius: 8px;
    background-color: alpha(@window_fg_color, 0.05);
    padding: 4px;
}
.remove-attachment-btn {
    opacity: 0.7;
}
.remove-attachment-btn:hover {
    opacity: 1.0;
    color: @error_color;
}

/* progress bar */
progressbar progress {
    background-color: @accent_bg_color;
    border-radius: 6px;
}
progressbar trough {
    background-color: alpha(@window_fg_color, 0.15);
    border-radius: 6px;
    min-height: 12px;
}
progressbar text {
    color: @window_fg_color;
    font-weight: bold;
    font-size: 11px;
}

/* copy btn */
.copy-btn {
    margin-top: 2px;
    margin-bottom: -6px;
    padding: 4px;
    min-height: 24px;
    min-width: 24px;
    border-radius: 6px;
    transition: background-color 0.2s ease;
}
.copy-btn:hover {
    background-color: alpha(@window_fg_color, 0.08);
}

/* sidebar hover */
.delete-btn {
    color: alpha(@window_fg_color, 0.5);
    transition: color 0.2s ease, transform 0.15s ease;
}

.delete-btn image {
    color: alpha(@window_fg_color, 0.5);
    transition: color 0.2s ease;
}

.delete-btn:hover {
    transform: scale(1.18);
}

.delete-btn:hover,
.delete-btn:hover image {
    color: #e54b4b;
}

.favorite-btn {
    color: alpha(@window_fg_color, 0.3);
    transition: color 0.2s ease, transform 0.15s ease;
}

.favorite-btn image {
    color: alpha(@window_fg_color, 0.3);
    transition: color 0.2s ease;
}

.favorite-btn.active,
.favorite-btn.active image {
    color: #ffc107;
}

.favorite-btn:hover {
    transform: scale(1.18);
}

.favorite-btn:hover,
.favorite-btn:hover image {
    color: #ffc107;
}

/* model picker */
.model-picker-header {
    font-weight: bold;
    font-size: 10px;
    color: alpha(@window_fg_color, 0.45);
    padding: 8px 14px 4px 14px;
}

.model-picker-list {
    background-color: transparent;
    padding: 4px;
}

.model-picker-row {
    border-radius: 8px;
    margin: 2px 6px;
    padding: 2px;
    transition: background-color 0.15s ease, border-color 0.15s ease;
}

.model-picker-row:hover {
    background-color: alpha(@window_fg_color, 0.05);
}

.model-picker-row.selected-model-row {
    background-color: alpha(@accent_bg_color, 0.08);
}

.model-picker-row.selected-model-row:hover {
    background-color: alpha(@accent_bg_color, 0.12);
}

/* icons */
.model-icon {
    color: alpha(@window_fg_color, 0.7);
    margin-left: 6px;
}

.selected-model-row .model-icon {
    color: @accent_bg_color;
}

.model-name-label {
    font-weight: 600;
    font-size: 14px;
    color: @window_fg_color;
}

.selected-model-row .model-name-label {
    color: @accent_bg_color;
}

.uninstalled-model-label {
    color: alpha(@window_fg_color, 0.6);
}

/* badges */
.model-badge {
    font-size: 9px;
    font-weight: bold;
    border-radius: 6px;
    padding: 1px 6px;
    margin-right: 4px;
    text-transform: uppercase;
}

.model-badge.badge-installed {
    background-color: alpha(#2ec27e, 0.15);
    color: #2ec27e;
}

.model-badge.badge-vlm {
    background-color: alpha(#c061cb, 0.15);
    color: #c061cb;
}

.model-badge.badge-available {
    background-color: alpha(@window_fg_color, 0.08);
    color: alpha(@window_fg_color, 0.6);
}

.model-badge.badge-downloading {
    background-color: alpha(#f5c211, 0.15);
    color: #e5a50a;
}

.model-badge.badge-active {
    background-color: alpha(@accent_bg_color, 0.15);
    color: @accent_bg_color;
}

/* picker btns */
.model-check-icon image {
    color: @accent_bg_color;
    margin-right: 6px;
}

.model-picker-row button.flat {
    border-radius: 6px;
    min-height: 28px;
    min-width: 28px;
    padding: 0;
    transition: background-color 0.2s ease, color 0.2s ease, transform 0.15s ease;
}

.model-picker-row button.flat image {
    margin: 0;
    padding: 0;
}

.model-picker-row button.flat:hover {
    background-color: alpha(@window_fg_color, 0.08);
}

.model-picker-row button.flat.download-btn {
    color: @accent_bg_color;
}

.model-picker-row button.flat.download-btn:hover {
    transform: scale(1.15);
    color: shade(@accent_bg_color, 1.1);
}

.model-picker-row button.flat.delete-btn {
    color: alpha(@window_fg_color, 0.4);
}

.model-picker-row button.flat.delete-btn:hover {
    color: #e54b4b;
    transform: scale(1.15);
}

.model-picker-row button.flat.info-btn {
    color: alpha(@window_fg_color, 0.4);
}

.model-picker-row button.flat.info-btn:hover {
    color: @accent_bg_color;
    transform: scale(1.15);
}
"""

def markdown_to_pango(text: str) -> str:
    text = text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', text)
    return text

def looks_like_code(text: str) -> bool:
    # guess if it's code
    lines = text.split('\n')
    if len(lines) < 2: return False
    
    score = 0
    
    # strong hints
    high_signal = [
        r"def\s+\w+\(.*\):",           # py func
        r"if\s+__name__\s*==\s*",       # py main
        r"#include\s*[<\"]",            # include
        r"int\s+main\s*\(",             # c main
        r"void\s+\w+\s*\(",             # func
        r"public\s+class\s+\w+",        # class
        r"const\s+\w+\s*=\s*\(.*\)\s*=>", # js func
        r"#!/bin/\w+",                  # shebang
    ]
    
    # weaker hints
    mid_signal = [
        r"^import\s+\w+",               # import
        r"^from\s+\w+\s+import",        # from import
        r"console\.log\(",              # js log
        r"std::\w+",                    # cpp ns
        r"printf\(",                    # c print
        r"cout\s*<<",                   # cpp print
        r"export\s+\w+=",               # bash
        r"apt-get\s+install",           # apt
        r"pacman\s+-S",                 # pacman
    ]

    for line in lines:
        line = line.strip()
        if not line: continue
        
        for pattern in high_signal:
            if re.search(pattern, line): score += 15
        for pattern in mid_signal:
            if re.search(pattern, line): score += 5
            
        # syntax cues
        if any(line.endswith(c) for c in [';', '{', '}', ':', ')']):
            score += 3
        if line.startswith('    ') or line.startswith('\t'):
            score += 3

    # if >= 15 it's code
    return score >= 15

def parse_message(text: str):
    # parse text into chunks
    if not text:
        return [("text", "", None)]
    
    # check for backticks
    if "```" in text:
        pattern = re.compile(r"```(\w+)?(?:\s|\n)*(.*?)```", re.DOTALL)
        chunks = []
        last_end = 0
        
        # auto detect language
        py_keywords = {"import", "from", "def", "class", "print", "if __name__"}
        sh_keywords = {"sudo", "apt", "pacman", "ls", "grep", "cd", "export", "echo"}
        c_keywords = {"#include", "int main", "void ", "char*", "printf"}
        
        for match in pattern.finditer(text):
            if match.start() > last_end:
                chunks.append(("text", text[last_end:match.start()], None))
            
            language = match.group(1)
            code = match.group(2)
            
            if not language:
                code_lower = code.lower()
                if any(k in code_lower for k in py_keywords): language = "python3"
                elif any(k in code_lower for k in sh_keywords): language = "sh"
                elif any(k in code_lower for k in c_keywords): language = "c"
                else: language = "text"
            
            chunks.append(("code", code.strip(), language))
            last_end = match.end()
        
        if last_end < len(text):
            chunks.append(("text", text[last_end:], None))
        return chunks
    
    # try heuristic
    if looks_like_code(text):
        return [("code", text.strip(), "text")]  # trigger auto
        
    return [("text", text, None)]
