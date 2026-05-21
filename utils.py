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

def looks_like_code(text: str) -> bool:
    """Heuristic to determine if a block of text is code without backticks."""
    lines = text.split('\n')
    if len(lines) < 2: return False # Ignore very short single-word messages
    
    score = 0
    
    # 1. High-Signal Patterns (+15 points each)
    high_signal = [
        r"def\s+\w+\(.*\):",           # Python function
        r"if\s+__name__\s*==\s*",       # Python main
        r"#include\s*[<\"]",            # C/C++ include
        r"int\s+main\s*\(",             # C main
        r"void\s+\w+\s*\(",             # C/Java function
        r"public\s+class\s+\w+",        # Java/C# class
        r"const\s+\w+\s*=\s*\(.*\)\s*=>", # JS Arrow function
        r"#!/bin/\w+",                  # Shebang
    ]
    
    # 2. Mid-Signal Patterns (+5 points each)
    mid_signal = [
        r"^import\s+\w+",               # Import at start of line
        r"^from\s+\w+\s+import",        # Python from-import
        r"console\.log\(",              # JS log
        r"std::\w+",                    # C++ namespace
        r"printf\(",                    # C print
        r"cout\s*<<",                   # C++ print
        r"export\s+\w+=",               # Bash export
        r"apt-get\s+install",           # Linux command
        r"pacman\s+-S",                 # Arch command
    ]

    for line in lines:
        line = line.strip()
        if not line: continue
        
        for pattern in high_signal:
            if re.search(pattern, line): score += 15
        for pattern in mid_signal:
            if re.search(pattern, line): score += 5
            
        # 3. Structural Signal
        if any(line.endswith(c) for c in [';', '{', '}', ':', ')']):
            score += 3
        if line.startswith('    ') or line.startswith('\t'):
            score += 3

    # Threshold: 15 points means we are confident it's code
    return score >= 15

def parse_message(text: str):
    """Parses text into a list of (type, content, language) chunks."""
    if not text:
        return [("text", "", None)]
    
    # Check for backticks first
    if "```" in text:
        pattern = re.compile(r"```(\w+)?(?:\s|\n)*(.*?)```", re.DOTALL)
        chunks = []
        last_end = 0
        
        # Language detection keywords
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
    
    # If no backticks, use heuristic for the whole message
    if looks_like_code(text):
        return [("code", text.strip(), "text")] # Use "text" language to trigger auto-detection in display.py
        
    return [("text", text, None)]
