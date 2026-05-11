#!/usr/bin/env python3
import socket, time, subprocess, json, sys, select, argparse, os, signal, random, threading
import requests
from datetime import datetime

def signal_handler(sig, frame):
    try:
        addr, tags = b"/chatbox/input\0\0", b",sT\0"
        socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b" \0", ("127.0.0.1", 9000))
    except: pass
    os._exit(0)

signal.signal(signal.SIGINT, signal_handler)

parser = argparse.ArgumentParser(description="vrc-py: NVIDIA VRChat OSC HUD")
parser.add_argument('--message', type=str, default=".")
parser.add_argument('--order', nargs='+', default=['line1', 'line2', 'line3', 'line4', 'line5'])
parser.add_argument('--player', type=str, default="spotify")
parser.add_argument('--debug', action='store_true', help="Print OSC output to terminal")
args = parser.parse_args()

lyric_data = {"lyrics": [], "loading": False, "song_id": "", "last_idx": -1}

def debug_log(msg):
    if args.debug:
        print(f"[{datetime.now().strftime('%H:%M:%S')}] DEBUG: {msg}")

def fetch_lyrics_bg(artist, title, song_id):
    global lyric_data
    lyric_data["loading"] = True
    clean_t = title.split(" - ")[0].split(" (")[0].split(" [")[0].split(" feat.")[0].strip()
    clean_a = artist.split(",")[0].split(" & ")[0].strip()
    try:
        r = requests.get("https://lrclib.net/api/get", 
                         params={'artist_name': clean_a, 'track_name': clean_t}, 
                         headers={'User-Agent': 'vrc-py-hud/1.0'}, timeout=10)
        if r.status_code == 200:
            res = r.json()
            raw = res.get('syncedLyrics') or res.get('plainLyrics')
            if raw:
                parsed = []
                for l in raw.split('\n'):
                    if "[" in l and "]" in l:
                        try:
                            ts = int(l[1:3]) * 60 + float(l[4:9])
                            txt = l[10:].strip()
                            parsed.append({"ts": ts, "txt": txt})
                        except: continue
                    elif l.strip():
                        parsed.append({"ts": 0, "txt": l.strip()})
                lyric_data["lyrics"] = parsed
                debug_log(f"Fetched {len(parsed)} lyric lines")
    except Exception as e:
        debug_log(f"Lyric Fetch Error: {e}")
    lyric_data["loading"] = False
    lyric_data["song_id"] = song_id
    lyric_data["last_idx"] = -1

def get_audio_data():
    try:
        p = f"--player={args.player}"
        meta = lambda k: subprocess.check_output(["playerctl", p, "metadata", k], text=True).strip()
        pos = float(subprocess.check_output(["playerctl", p, "position"], text=True).strip())
        stat = subprocess.check_output(["playerctl", p, "status"], text=True).strip()
        vol = float(subprocess.check_output(["playerctl", p, "volume"], text=True).strip())
        try: length = float(meta("mpris:length")) / 1000000
        except: length = 0
        return meta("artist"), meta("title"), pos, length, stat, vol
    except: return None, None, 0, 0, "Closed", 0

def get_stats():
    try:
        gpu = subprocess.check_output(["nvidia-smi", "--query-gpu=utilization.gpu", "--format=csv,noheader,nounits"], text=True).strip()
        with open('/proc/stat') as f:
            l = f.readline().split()
            cpu = round((1 - float(l[4])/sum(float(i) for i in l[1:])) * 100)
        with open('/proc/meminfo') as f:
            m = {ln.split()[0]: int(ln.split()[1]) for ln in f.readlines()[:4]}
            ram = round(((m['MemTotal:'] - m['MemAvailable:']) / m['MemTotal:']) * 100)
        return f"C:{cpu}% | G:{gpu}% | R:{ram}%"
    except: return "Stats Err"

def fmt_time(s):
    m, s = divmod(int(s), 60); h, m = divmod(m, 60)
    return f"{h:02}:{m:02}:{s:02}" if h > 0 else f"{m:02}:{s:02}"

def send(text):
    debug_log(f"Sending OSC:\n{text}")
    addr, tags = b"/chatbox/input\0\0", b",sT\0"
    b_text = text.encode('utf-8') + b"\0"
    b_text += b"\0" * (4 - (len(b_text) % 4)) if len(b_text) % 4 != 0 else b""
    socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b_text, ("127.0.0.1", 9000))

cur_song, msg_ovr, last, last_pos, last_send_time = "", args.message, "", 0, 0
active_lyric, lyric_locked_until = "🎶🎶🎶", 0

while True:
    if select.select([sys.stdin], [], [], 0)[0]:
        msg_ovr = sys.stdin.readline().strip() or msg_ovr

    try:
        art, tit, pos, length, stat, vol = get_audio_data()
        now_ts = time.time()

        if tit and tit != cur_song:
            cur_song = tit
            lyric_data["lyrics"], lyric_data["last_idx"] = [], -1
            threading.Thread(target=fetch_lyrics_bg, args=(art, tit, tit), daemon=True).start()

        if pos < last_pos - 2 or pos > last_pos + 5:
            lyric_data["last_idx"] = -1

        if now_ts >= lyric_locked_until:
            if lyric_data["lyrics"]:
                best_idx = -1
                for i, l in enumerate(lyric_data["lyrics"]):
                    if l["ts"] <= pos: best_idx = i
                
                if best_idx != -1 and best_idx != lyric_data["last_idx"]:
                    active_lyric = f"🎤 {lyric_data['lyrics'][best_idx]['txt']}" if lyric_data['lyrics'][best_idx]['txt'] else "🎶🎶🎶"
                    lyric_data["last_idx"], lyric_locked_until = best_idx, now_ts + 1.2

        vol_pct = int(vol * 100)
        p_flag = " ⏸" if (pos == last_pos and stat != "Playing") else ""
        bar_len = 10
        fill = int((pos/length) * bar_len) if length > 0 else 0
        
        # Line 5: Volume leading, no clock
        l5 = f"🔊{vol_pct}% | {fmt_time(pos)}/{fmt_time(length)} [{'▰'*fill}{'▱'*(bar_len-fill)}]{p_flag}"

        last_pos = pos
        data = {
            "line1": f"🎵 {tit} - {art}" if tit else "Idle",
            "line2": active_lyric,
            "line3": get_stats(),
            "line4": f"💬 {msg_ovr}",
            "line5": l5
        }
        
        out = "\n".join([data[k] for k in args.order if k in data])
        if out != last and (now_ts - last_send_time) > 1.1:
            send(out)
            last, last_send_time = out, now_ts
    except Exception as e:
        debug_log(f"HUD Error: {e}")
    time.sleep(0.3)
