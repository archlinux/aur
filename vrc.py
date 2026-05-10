#!/usr/bin/env python3
import socket, time, subprocess, json, sys, select, argparse, os, signal, random, threading

# Dependency Check
try:
    import requests
except ImportError:
    print("Error: 'python-requests' is required. Run: sudo pacman -S python-requests")
    sys.exit(1)

def signal_handler(sig, frame):
    try:
        addr, tags = b"/chatbox/input\0\0", b",sT\0"
        socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b" \0", ("127.0.0.1", 9000))
    except: pass
    os._exit(0)

signal.signal(signal.SIGINT, signal_handler)

parser = argparse.ArgumentParser(description="vrc-py: Universal Edition", add_help=False)
parser.add_argument('--message', type=str, default="vrc-py-uni")
parser.add_argument('--order', nargs='+', default=['line1', 'line2', 'line3', 'line4', 'line5'])
parser.add_argument('--player', type=str, default="spotify")
parser.add_argument('--debug', action='store_true')
args = parser.parse_args()

state = {"lyrics": [], "loading": False, "song_id": "", "last_idx": -1, "lock_until": 0}

def fetch_lyrics_bg(artist, title, song_id):
    global state
    state["loading"] = True
    clean_t = title.split(" - ")[0].split(" (")[0].split(" [")[0].strip()
    clean_a = artist.split(",")[0].strip()
    
    for q in [f"{clean_t} {clean_a}", clean_t]:
        try:
            r = requests.get("https://lrclib.net/api/search", params={'q': q}, 
                             headers={'User-Agent': 'vrc-py-uni/1.0'}, timeout=8)
            if r.status_code == 200 and r.json():
                res = r.json()[0]
                raw = res.get('syncedLyrics') or res.get('plainLyrics')
                if raw:
                    parsed = []
                    for l in raw.split('\n'):
                        if "[" in l and "]" in l:
                            try:
                                ts = int(l[1:3]) * 60 + float(l[4:9])
                                parsed.append({"ts": ts, "txt": l[10:].strip()})
                            except: continue
                    state["lyrics"] = parsed
                    break
        except: continue
    state["loading"], state["song_id"], state["last_idx"] = False, song_id, -1

def get_stats():
    try:
        with open('/proc/stat') as f:
            l = f.readline().split()
            cpu = round((1 - float(l[4])/sum(float(i) for i in l[1:])) * 100)
        with open('/proc/meminfo') as f:
            m = {ln.split()[0]: int(ln.split()[1]) for ln in f.readlines()[:4]}
            ram = round(((m['MemTotal:'] - m['MemAvailable:']) / m['MemTotal:']) * 100)
        
        gpu = "0"
        if os.path.exists("/usr/bin/nvidia-smi"):
            gpu = subprocess.check_output(["nvidia-smi", "--query-gpu=utilization.gpu", "--format=csv,noheader,nounits"], text=True).strip()
        elif os.path.exists("/sys/class/drm/card0/device/gpu_busy_percent"):
            with open("/sys/class/drm/card0/device/gpu_busy_percent", 'r') as f:
                gpu = f.read().strip()
        return f"C:{cpu}% | G:{gpu}% | R:{ram}%"
    except: return "Stats Err"

def send(text):
    addr, tags = b"/chatbox/input\0\0", b",sT\0"
    b_text = text.encode('utf-8') + b"\0"
    b_text += b"\0" * (4 - (len(b_text) % 4)) if len(b_text) % 4 != 0 else b""
    socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b_text, ("127.0.0.1", 9000))

cur_song, msg_ovr, last, last_send = "", args.message, "", 0
active_lyric = "🎶🎶🎶"
roasts = ["this lrc fucking sucks", "woah this lrc sucks buttocks"]

while True:
    if select.select([sys.stdin], [], [], 0)[0]:
        msg_ovr = sys.stdin.readline().strip() or msg_ovr
    try:
        p_cmd = f"--player={args.player}"
        art = subprocess.check_output(["playerctl", p_cmd, "metadata", "artist"], text=True).strip()
        tit = subprocess.check_output(["playerctl", p_cmd, "metadata", "title"], text=True).strip()
        pos = float(subprocess.check_output(["playerctl", p_cmd, "position"], text=True).strip())
        stat = subprocess.check_output(["playerctl", p_cmd, "status"], text=True).strip()
        try: length = float(subprocess.check_output(["playerctl", p_cmd, "metadata", "mpris:length"], text=True).strip()) / 1000000
        except: length = 0
        
        now = time.time()

        if tit != cur_song:
            cur_song, state["lyrics"], state["last_idx"] = tit, [], -1
            if not state["loading"]:
                threading.Thread(target=fetch_lyrics_bg, args=(art, tit, tit), daemon=True).start()
            cur_roast = random.choice(roasts)
        
        if now >= state["lock_until"]:
            if state["loading"]: active_lyric = "🎤 Searching..."
            elif state["lyrics"]:
                found_idx = -1
                for i, l in enumerate(state["lyrics"]):
                    if l["ts"] <= pos: found_idx = i
                    else: break
                if found_idx > state["last_idx"]:
                    txt = state["lyrics"][found_idx]["txt"]
                    active_lyric = f"🎤 {txt}" if txt else "🎶🎶🎶"
                    state["last_idx"], state["lock_until"] = found_idx, now + 1.2
                if found_idx != -1 and (pos - state["lyrics"][found_idx]["ts"]) > 15:
                    active_lyric = f"🎤 ({cur_roast})"

        p_flag = " ⏸" if stat != "Playing" else ""
        bar = "▰"*int((pos/length)*10) + "▱"*(10-int((pos/length)*10)) if length > 0 else "LIVE"
        l5 = f"🕒 {int(pos//60):02}:{int(pos%60):02} / {int(length//60):02}:{int(length%60):02} [{bar}]{p_flag}"

        data = {"line1": f"🎵 {tit} - {art}" if tit else "Idle", "line2": active_lyric, "line3": get_stats(), "line4": f"💬 {msg_ovr}", "line5": l5}
        out = "\n".join([data[k] for k in args.order if k in data])
        
        if out != last and (now - last_send) > 1.1:
            send(out); last, last_send = out, now
    except: pass
    time.sleep(0.4)
