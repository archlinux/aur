# load and apply accent color
import os
import json
import utils

def load_theme_color() -> str:
    # get color
    config_path = os.path.expanduser("~/.config/flm/theme.json")
    if os.path.exists(config_path):
        try:
            with open(config_path, "r") as f:
                return json.load(f).get("accent_color", "#3584e4")
        except: pass
    return "#3584e4"

def apply_theme(app, hex_color: str) -> None:
    # apply css
    full_css = f"""
    @define-color accent_bg_color {hex_color};
    {utils.CSS}
    """
    app.css_provider.load_from_data(full_css.encode())
