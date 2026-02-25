from flask import Flask, request, jsonify
import subprocess, os, sys, json
from werkzeug.utils import secure_filename 
from waitress import serve
import gi

gi.require_version('Gdk', '4.0')
from gi.repository import GLib, Gdk

flask_app = Flask(__name__)

config_dir = os.path.join(GLib.get_user_config_dir(), "flameget")
os.makedirs(config_dir, exist_ok=True)

data_dir = os.path.join(GLib.get_user_data_dir(), "flameget")
os.makedirs(data_dir, exist_ok=True)

install_dir = os.path.dirname(os.path.abspath(__file__))

settings_file = os.path.join(config_dir, "settings.json")
downloader_script_path = os.path.join(install_dir, "downloader.py")
browser_context_menu_handler_script_path = os.path.join(install_dir, "browser_context_menu_handler.py")

def load_settings():
    default_css = os.path.join(config_dir, "dark_style.css")
    custom_css = os.path.join(config_dir, "custom_style.css")

    defaults = {
        "engine": "Aria2",
        "css_path": default_css,
        "custom_css_path": custom_css,
        "default_segments": 8,
        "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "confirm_delete": True,
        "notifications": True,
        "default_download_dir": GLib.get_user_special_dir(GLib.UserDirectory.DIRECTORY_DOWNLOAD),
        "theme_mode": "Dark",
        "language": "en",
        "font_name": "Sans Regular 11",
        "ui_scale": 100,
        "start_on_boot": False,
        "show_finish_dialog": True,
        "enable_toasts":True,
        "chk_has_borders": True,
        "enable_integration": True,
        "ctx_menu_offsets": {"x": 100, "y":0},
        "start_in_minimize_mode": False,
        "auto_start": False,
        "global_speed_limit": "0",
        "browser_port": "6800",
        "sort_column": "Date Added",
        "sort_direction": 1,
        "on_finish_action": "Do Nothing",
        "custom_finish_cmd": "",
        "shortcuts": {
            "new_download": [Gdk.KEY_n, Gdk.ModifierType.CONTROL_MASK],
            "delete": [Gdk.KEY_Delete, 0],
            "select_all": [Gdk.KEY_a, Gdk.ModifierType.CONTROL_MASK],
            "open_file": [Gdk.KEY_o, Gdk.ModifierType.CONTROL_MASK],
            "quit": [Gdk.KEY_q, Gdk.ModifierType.CONTROL_MASK],
            "close_window": [Gdk.KEY_w, Gdk.ModifierType.CONTROL_MASK]
        }
    }
    if os.path.exists(settings_file):
        try:
            with open(settings_file, 'r') as f:
                data = json.load(f)
                defaults.update(data)
        except: pass
    return defaults

app_settings = load_settings()

@flask_app.route('/sync')
def sync():
    data = {
        "status": "ok",
        "enabled": True,
        "fileExts": ["*"], 
        "blockedHosts": [],
        "tabsWatcher": [],
        "videoList": [],
        "mediaExts": [""],
        "matchingHosts": [],
        "mediaTypes": [],
        "message": "Hello from Python!"
    }
    return jsonify(data)
    
@flask_app.route("/video_download", methods=["POST"])
def handle_video_download():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No JSON data received"}), 400

    url = data.get("url")
    isAuto = data.get("isAuto")
    # 1. Validation Check
    if not url:
        print("Error: 'url' parameter is missing in the request!")
        return jsonify({"error": "Missing 'url' parameter"}), 400

    # 2. Configuration Check
    if not browser_context_menu_handler_script_path:
        print("Error: Middleman script path is not configured!")
        return jsonify({"error": "Server configuration error"}), 500

    cmd = [
        sys.executable, 
        browser_context_menu_handler_script_path,
        url
    ]

    if isAuto:
        autoType = data.get("autoType")
        autoQuality = data.get("autoQuality")
        autoFormat = data.get("autoFormat")
        chkPlaylist = data.get("chkPlaylist")
        if autoType:
            cmd.append("--audio")
        if chkPlaylist:
            cmd.append("--playlist")
        if autoFormat:
            cmd.extend(["--ext", "." +autoFormat])
        if autoQuality:
            cmd.extend(["--quality", autoQuality])

    subprocess.Popen(cmd)
    return jsonify({"status": "ok"})

@flask_app.route("/download", methods=["POST"])
def handle_download():
    data = request.get_json()
    if data == None:
        return
        
    url = data.get("url")
    raw_name = data.get("filename")
    if raw_name:
        raw_name = os.path.basename(raw_name)

    filename = secure_filename(raw_name or "download.dat")
    
    raw_size = data.get("fileSize")
    try:
        if raw_size is None or int(raw_size) < 0:
            size_str = "0"
        else:
            size_str = str(int(raw_size))
    except (ValueError, TypeError):
        size_str = "0"

    cookies = data.get("cookies", None)
    user_agent = data.get("userAgent", None)
    referer = data.get("referer", None)

    print(f"Starting Download: {filename} (Size: {size_str})")

    cmd = [
        sys.executable, 
        downloader_script_path,
        url,
        filename,
        size_str,
        app_settings.get("default_download_dir")
    ]

    cmd.extend(["--segments", str(app_settings.get("default_segments"))])
    cmd.extend(["--id", "-1"])
    cmd.extend(["--speed-limit", str(app_settings.get("global_speed_limit"))])

    if cookies: cmd.append(f"--cookies={cookies}")
    if user_agent: cmd.append(f"--user-agent={user_agent}")
    if referer: cmd.append(f"--referer={referer}")

    subprocess.Popen(cmd)
    return jsonify({"status": "ok", "filename": filename})

if __name__ == '__main__':
    base_port = int(app_settings.get("browser_port"))
    try:
        print(f"Attempting to start server on 127.0.0.1:{base_port}...")        
        serve(flask_app, host='127.0.0.1', port=base_port, threads=4)
        
    except OSError as e:
        if "Address already in use" in str(e) or e.errno == 98:
            print(f"Port {base_port} is busy.")
        else:
            raise e