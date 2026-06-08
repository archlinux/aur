from flask import Flask, render_template, request, redirect, url_for, jsonify, send_from_directory, session
import psutil
import subprocess
import platform
import socket
import os
import shutil
import tarfile
import time
import shlex
import json
from functools import wraps

app = Flask(__name__)
app.secret_key = 'shrike-cc-super-secret-key-change-me' 

# --- DYNAMIC AUTH CONFIG ---
CREDS_FILE = "/etc/shrike-cc/credentials.json"

def load_credentials():
    default_creds = {"username": "admin", "password": "shrike"}
    if not os.path.exists(CREDS_FILE):
        try:
            os.makedirs(os.path.dirname(CREDS_FILE), exist_ok=True)
            with open(CREDS_FILE, 'w') as f:
                json.dump(default_creds, f, indent=4)
            return default_creds
        except Exception as e:
            print(f"Could not write credentials file: {e}")
            return default_creds
    try:
        with open(CREDS_FILE, 'r') as f:
            return json.load(f)
    except:
        return default_creds

def save_credentials(username, password):
    creds = {"username": username, "password": password}
    try:
        os.makedirs(os.path.dirname(CREDS_FILE), exist_ok=True)
        with open(CREDS_FILE, 'w') as f:
            json.dump(creds, f, indent=4)
        return True
    except Exception as e:
        print(f"Error saving credentials: {e}")
        return False

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'logged_in' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

@app.before_request
def check_login():
    if request.endpoint == 'login' or request.endpoint == 'static':
        return
    if 'logged_in' not in session:
        return redirect(url_for('login'))

# --- SECURITY HEADERS ---
@app.after_request
def set_security_headers(response):
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['X-Frame-Options'] = 'DENY'
    response.headers['Content-Security-Policy'] = "default-src 'self'; script-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; style-src 'self' 'unsafe-inline'; img-src 'self' data:;"
    return response

def get_sys_info():
    try: ip_addr = subprocess.check_output(['hostname', '-I']).decode().strip().split()[0]
    except: ip_addr = "127.0.0.1"
    
    user = os.environ.get('SUDO_USER', '')
    if not user:
        try:
            out = subprocess.check_output(['who']).decode()
            for line in out.splitlines():
                if '(:0)' in line or '(:1)' in line:
                    user = line.split()[0]
                    break
        except: pass
    if not user: user = os.environ.get('USER', 'root')
    
    home_dir = os.path.expanduser(f"~{user}") if user != 'root' else os.path.expanduser("~")
    boot_time = psutil.boot_time()

    return { "hostname": socket.gethostname(), "ip": ip_addr, "os": f"Shrike Linux ({platform.machine()})", "kernel": platform.release(), "boot_time": boot_time, "home_dir": home_dir }

# --- DYNAMIC SERVICE DETECTION ---
CATEGORY_MAP = {
    "Web & Proxies": ["nginx", "httpd", "caddy", "traefik", "haproxy", "php-fpm", "lighttpd", "apache2"],
    "Databases": ["mariadb", "postgresql", "redis", "memcached", "influxdb", "elasticsearch", "mysql", "mongodb", "redis"],
    "Network & VPN": ["tailscaled", "cloudflared", "derper", "wg-quick", "openvpn", "openvpn-client", "NetworkManager", "dhcpcd", "systemd-networkd", "iwd", "wpa_supplicant"],
    "Security": ["ufw", "fail2ban", "apparmor", "clamav", "firewalld", "auditd"],
    "Virtualization": ["docker", "podman", "libvirtd", "vboxdrv", "qemu-guest-agent"],
    "Monitoring": ["prometheus", "grafana", "prometheus-node-exporter", "node_exporter", "loki"],
    "Mail": ["postfix", "dovecot", "sendmail"],
    "File Sharing": ["smbd", "vsftpd", "nfs-server", "nfs-server"]
}

def get_all_services():
    try:
        units_raw = subprocess.check_output(['systemctl', 'list-units', '--all', '--type=service', '--no-pager', '--no-legend'], stderr=subprocess.DEVNULL).decode().strip()
        files_raw = subprocess.check_output(['systemctl', 'list-unit-files', '--type=service', '--no-pager', '--no-legend'], stderr=subprocess.DEVNULL).decode().strip()
    except Exception as e:
        print(f"Error fetching services: {e}")
        return {}

    enabled_map = {}
    for line in files_raw.split('\n'):
        parts = line.split()
        if len(parts) >= 2: 
            enabled_map[parts[0]] = parts[1]

    categorized = {}
    for line in units_raw.split('\n'):
        parts = line.split(None, 4)
        if len(parts) < 4: continue
        
        name = parts[0]
        status = parts[2]
        desc = parts[4] if len(parts) == 5 else ""
        enabled = enabled_map.get(name, "unknown")
        base_name = name.replace('.service', '').split('@')[0] 
        
        category = "Other System Services"
        for cat, keys in CATEGORY_MAP.items():
            if base_name in keys:
                category = cat
                break
                
        if category not in categorized: categorized[category] = []
        categorized[category].append({
            "name": name,
            "display_name": name.replace('.service', ''),
            "status": status,
            "enabled": enabled in ["enabled", "enabled-runtime", "static"],
            "description": desc
        })
    
    sorted_cats = {k: categorized[k] for k in sorted(categorized.keys()) if k != "Other System Services"}
    if "Other System Services" in categorized: sorted_cats["Other System Services"] = categorized["Other System Services"]
    
    return sorted_cats

def open_terminal(cmd, cwd=None):
    user = os.environ.get('SUDO_USER', '')
    if not user:
        try:
            out = subprocess.check_output(['who']).decode()
            for line in out.splitlines():
                if '(:0)' in line or '(:1)' in line:
                    user = line.split()[0]
                    break
        except: pass
    if not user: user = 'root'
    
    env = os.environ.copy()
    env['DISPLAY'] = ':0'
    safe_cmd = shlex.quote(cmd)
    subprocess.Popen(['sudo', '-u', user, 'xfce4-terminal', '--title=Shrike Terminal', '-e', f'bash -c {safe_cmd}'], env=env, cwd=cwd)

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        creds = load_credentials()
        if request.form['username'] == creds['username'] and request.form['password'] == creds['password']:
            session['logged_in'] = True
            session['username'] = creds['username']
            return redirect(url_for('index'))
        else:
            error = "Invalid Credentials. Try again."
    return render_template('login.html', error=error)

@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    return redirect(url_for('login'))

@app.route('/')
@login_required
def index():
    info = get_sys_info()
    services = get_all_services()
    return render_template('dashboard.html', info=info, services=services)

@app.route('/api/stats')
@login_required
def api_stats():
    cpu_percent = psutil.cpu_percent(interval=0)
    mem = psutil.virtual_memory()
    disk = psutil.disk_usage('/')
    processes = []
    for p in psutil.process_iter(['pid', 'name', 'memory_percent']):
        try: processes.append(p.info)
        except: pass
    top_procs = sorted(processes, key=lambda p: p['memory_percent'], reverse=True)[:5]
    for p in top_procs: p['memory_percent'] = round(p['memory_percent'], 1)
    return jsonify({ "cpu": cpu_percent, "ram_total": round(mem.total / (1024**3), 1), "ram_used": round(mem.used / (1024**3), 1), "ram_percent": mem.percent, "disk_total": round(disk.total / (1024**3), 1), "disk_used": round(disk.used / (1024**3), 1), "disk_percent": disk.percent, "top_procs": top_procs })

@app.route('/api/settings', methods=['GET', 'POST'])
@login_required
def handle_settings():
    if request.method == 'GET':
        creds = load_credentials()
        return jsonify({"username": creds['username']})
    
    data = request.json
    new_user = data.get('username', '').strip()
    new_pass = data.get('password', '').strip()
    
    if not new_user:
        return jsonify({"error": "Username cannot be empty"}), 400
    
    creds = load_credentials()
    creds['username'] = new_user
    if new_pass:
        creds['password'] = new_pass
        
    if save_credentials(creds['username'], creds['password']):
        session['username'] = creds['username']
        return jsonify({"status": "ok"})
    return jsonify({"error": "Failed to save settings"}), 500

@app.route('/action/<svc>/<act>', methods=['POST'])
@login_required
def service_action(svc, act):
    if act in ['start', 'stop', 'restart', 'enable', 'disable']: subprocess.run(['systemctl', act, svc])
    return redirect(url_for('index'))

@app.route('/system/pacman-update', methods=['POST'])
@login_required
def pacman_update():
    open_terminal('sudo pacman -Syu')
    return jsonify({"status": "ok"})

@app.route('/system/shrike-update', methods=['POST'])
@login_required
def shrike_update():
    open_terminal('sudo pacman -S shrike-control-center')
    return jsonify({"status": "ok"})

@app.route('/system/pacman-install', methods=['POST'])
@login_required
def pacman_install():
    pkg = request.json.get('package', '')
    safe_pkg = shlex.quote(pkg)
    if pkg: open_terminal(f'sudo pacman -S {safe_pkg}')
    return jsonify({"status": "ok"})

@app.route('/system/build-pkg', methods=['POST'])
@login_required
def build_pkg():
    path = request.json.get('path', '')
    if path and os.path.isdir(path): open_terminal('makepkg -sf', cwd=path)
    return jsonify({"status": "ok"})

@app.route('/system/reboot', methods=['POST'])
@login_required
def system_action():
    subprocess.Popen(['sudo', 'reboot'])
    return jsonify({"status": "ok"})

# --- ADVANCED FILE MANAGER API ---
@app.route('/fm/list')
@login_required
def fm_list():
    path = request.args.get('path', '/')
    abs_path = os.path.abspath(path)
    if not os.path.exists(abs_path) or not os.path.isdir(abs_path): abs_path = '/'
    items = []
    try:
        for item in os.listdir(abs_path):
            full_item_path = os.path.join(abs_path, item)
            is_dir = os.path.isdir(full_item_path)
            size = 0 if is_dir else os.path.getsize(full_item_path)
            items.append({"name": item, "is_dir": is_dir, "size": size, "path": full_item_path, "is_hidden": item.startswith('.')})
    except PermissionError: pass
    items.sort(key=lambda x: (not x['is_dir'], x['name'].lower()))
    return jsonify({"path": abs_path, "items": items})

@app.route('/fm/upload', methods=['POST'])
@login_required
def fm_upload():
    path = request.form.get('path', '/')
    file = request.files.get('file')
    relative_path = request.form.get('relative_path', '')
    if file and file.filename:
        if relative_path:
            save_path = os.path.join(path, relative_path)
        else:
            save_path = os.path.join(path, file.filename)
        try:
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            file.save(save_path)
        except Exception as e: print(f"Upload error: {e}")
    return jsonify({"status": "ok"})

@app.route('/fm/download')
@login_required
def fm_download():
    path = request.args.get('path', '/')
    abs_path = os.path.abspath(path)
    if os.path.exists(abs_path):
        if os.path.isfile(abs_path): 
            return send_from_directory(os.path.dirname(abs_path), os.path.basename(abs_path), as_attachment=True)
    return "Not found", 404

@app.route('/fm/read')
@login_required
def fm_read():
    path = request.args.get('path', '/')
    abs_path = os.path.abspath(path)
    if os.path.exists(abs_path) and os.path.isfile(abs_path):
        try:
            with open(abs_path, 'r', errors='ignore') as f: content = f.read()
            return jsonify({"path": abs_path, "content": content, "name": os.path.basename(abs_path)})
        except: return jsonify({"error": "Cannot read"}), 403
    return jsonify({"error": "Not found"}), 404

@app.route('/fm/save', methods=['POST'])
@login_required
def fm_save():
    data = request.json
    path = data.get('path')
    content = data.get('content')
    try:
        with open(path, 'w') as f: f.write(content)
        return jsonify({"status": "ok"})
    except Exception as e: return jsonify({"error": str(e)}), 500

@app.route('/fm/mkdir', methods=['POST'])
@login_required
def fm_mkdir():
    data = request.json
    path = data.get('path')
    name = data.get('name')
    try:
        os.makedirs(os.path.join(path, name), exist_ok=True)
        return jsonify({"status": "ok"})
    except Exception as e: return jsonify({"error": str(e)}), 500

@app.route('/fm/touch', methods=['POST'])
@login_required
def fm_touch():
    data = request.json
    path = data.get('path')
    name = data.get('name')
    try:
        open(os.path.join(path, name), 'a').close()
        return jsonify({"status": "ok"})
    except Exception as e: return jsonify({"error": str(e)}), 500

@app.route('/fm/copy', methods=['POST'])
@login_required
def fm_copy():
    data = request.json
    source = data.get('source')
    dest_dir = data.get('destination')
    if not source or not dest_dir or not os.path.exists(source):
        return jsonify({"error": "Invalid source or destination"}), 400
    
    base_name = os.path.basename(source)
    target_path = os.path.join(dest_dir, base_name)
    
    counter = 1
    while os.path.exists(target_path):
        name, ext = os.path.splitext(base_name)
        if os.path.isdir(source):
            target_path = os.path.join(dest_dir, f"{name}_copy")
        else:
            target_path = os.path.join(dest_dir, f"{name}_copy{ext}")
        counter += 1

    try:
        if os.path.isdir(source):
            shutil.copytree(source, target_path)
        else:
            shutil.copy2(source, target_path)
        return jsonify({"status": "ok"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/fm/move', methods=['POST'])
@login_required
def fm_move():
    data = request.json
    source = data.get('source')
    dest_dir = data.get('destination')
    if not source or not dest_dir or not os.path.exists(source):
        return jsonify({"error": "Invalid source or destination"}), 400
    
    base_name = os.path.basename(source)
    target_path = os.path.join(dest_dir, base_name)
    
    if os.path.exists(target_path):
        return jsonify({"error": "Item with this name already exists in destination"}), 400

    try:
        shutil.move(source, target_path)
        return jsonify({"status": "ok"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/fm/action', methods=['POST'])
@login_required
def fm_action():
    data = request.json
    action = data.get('action')
    path = data.get('path')
    target = data.get('target', '')
    
    try:
        if action == 'rename': os.rename(path, target)
        elif action == 'delete':
            if os.path.isdir(path): shutil.rmtree(path)
            else: os.remove(path)
        elif action == 'trash':
            trash_dir = os.path.expanduser("~/.local/share/Trash/files")
            os.makedirs(trash_dir, exist_ok=True)
            dest = os.path.join(trash_dir, os.path.basename(path))
            shutil.move(path, dest)
        elif action == 'duplicate':
            if os.path.isdir(path): shutil.copytree(path, path + "_copy")
            else: shutil.copy2(path, path + "_copy")
        elif action == 'archive':
            archive_name = os.path.basename(path) + ".tar.gz"
            archive_path = os.path.join(os.path.dirname(path), archive_name)
            with tarfile.open(archive_path, "w:gz") as tar: tar.add(path, arcname=os.path.basename(path))
        elif action == 'terminal':
            if os.path.isfile(path): dir_path = os.path.dirname(path)
            else: dir_path = path
            open_terminal('bash', cwd=dir_path)
        else: return jsonify({"error": "Invalid action"}), 400
        return jsonify({"status": "ok"})
    except Exception as e: return jsonify({"error": str(e)}), 500

@app.route('/fm/properties')
@login_required
def fm_properties():
    path = request.args.get('path', '/')
    abs_path = os.path.abspath(path)
    if os.path.exists(abs_path):
        stat = os.stat(abs_path)
        return jsonify({ "path": abs_path, "size": os.path.getsize(abs_path) if os.path.isfile(abs_path) else 0, "modified": time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(stat.st_mtime)), "is_dir": os.path.isdir(abs_path) })
    return jsonify({"error": "Not found"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=False)