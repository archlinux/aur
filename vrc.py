#!/usr/bin/env python3
import socket, time, subprocess, json, sys, select, argparse, os, signal, random, threading
import requests

def signal_handler(sig, frame):
    try:
        addr, tags = b"/chatbox/input\0\0", b",sT\0"
        socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b" \0", ("127.0.0.1", 9000))
    except: pass
    os._exit(0)

signal.signal(signal.SIGINT, signal_handler)

parser = argparse.ArgumentParser(description="vrc-py: NVIDIA VRChat OSC HUD", add_help=False)
parser.add_argument('--message', type=str, default="vrc-py | NVIDIA")
parser.add_argument('--order', nargs='+', default=['line1', 'line2', 'line3', 'line4', 'line5'])
parser.add_argument('--player', type=str, default="spotify")
parser.add_argument('--debug', action='store_true')
args = parser.parse_args()

lyric_data = {"lyrics": [], "loading": False, "song_id": "", "last_idx": -1}

def fetch_lyrics_bg(artist, title, song_id):
    global lyric_data
    lyric_data["loading"] = True
    clean_t = title.split(" - ")[0].split(" (")[0].split(" [")[0].split(" feat.")[0].strip()
    clean_a = artist.split(",")[0].split(" & ")[0].strip()
    
    for q in [f"{clean_t} {clean_a}", clean_t]:
        try:
            r = requests.get("https://lrclib.net/api/search", params={'q': q}, 
                             headers={'User-Agent': 'vrc-py-hud/1.0'}, timeout=10)
            if r.status_code == 200 and r.json():
                res = r.json()[0]
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
                    break
        except: pass
    lyric_data["loading"] = False
    lyric_data["song_id"] = song_id
    lyric_data["last_idx"] = -1

def get_audio_data():
    try:
        p = f"--player={args.player}"
        meta = lambda k: subprocess.check_output(["playerctl", p, "metadata", k], text=True).strip()
        pos = float(subprocess.check_output(["playerctl", p, "position"], text=True).strip())
        stat = subprocess.check_output(["playerctl", p, "status"], text=True).strip()
        try: length = float(meta("mpris:length")) / 1000000
        except: length = 0
        return meta("artist"), meta("title"), pos, length, stat
    except: return None, None, 0, 0, "Closed"

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
    addr, tags = b"/chatbox/input\0\0", b",sT\0"
    b_text = text.encode('utf-8') + b"\0"
    b_text += b"\0" * (4 - (len(b_text) % 4)) if len(b_text) % 4 != 0 else b""
    socket.socket(socket.AF_INET, socket.SOCK_DGRAM).sendto(addr + tags + b_text, ("127.0.0.1", 9000))

# State
cur_song, msg_ovr, last, last_pos = "", args.message, "", 0
last_send_time = 0
active_lyric = "🎶🎶🎶"
lyric_locked_until = 0

while True:
    if select.select([sys.stdin], [], [], 0)[0]:
        msg_ovr = sys.stdin.readline().strip() or msg_ovr

    try:
        art, tit, pos, length, stat = get_audio_data()
        now_ts = time.time()

        if tit and tit != cur_song:
            cur_song = tit
            lyric_data["lyrics"] = []
            lyric_data["last_idx"] = -1
            if not lyric_data["loading"]:
                threading.Thread(target=fetch_lyrics_bg, args=(art, tit, tit), daemon=True).start()

        # Update Stats
        l3 = get_stats()

        # Queue Logic: Only update lyric if we aren't "locked" showing a fast-split line
        if now_ts >= lyric_locked_until:
            if lyric_data["loading"]:
                active_lyric = "🎤 Searching..."
            elif lyric_data["lyrics"]:
                found_new = False
                # Find the latest lyric that matches current position
                for i, l in enumerate(lyric_data["lyrics"]):
                    if l["ts"] <= pos:
                        if i > lyric_data["last_idx"]:
                            txt = l["txt"]
                            if not txt or any(x in txt.lower() for x in ["lyrics by", "produced by", "album:"]):
                                active_lyric = "🎶🎶🎶"
                            else:
                                active_lyric = f"🎤 {txt}"
                            
                            lyric_data["last_idx"] = i
                            found_new = True
                
                # If we just found a new line, lock it for a tiny bit so it doesn't vanish instantly
                if found_new:
                    lyric_locked_until = now_ts + 1.2 # Show for at least 1.2s

        # Timeline
        is_paused = (pos == last_pos and stat != "Playing")
        p_flag = " ⏸" if is_paused else ""
        l5 = f"🕒 {fmt_time(pos)} / {fmt_time(length)} [{'▰'*int((pos/length)*10)}{'▱'*(10-int((pos/length)*10))}]" + p_flag if length > 0 else f"🕒 {fmt_time(pos)} [LIVE]" + p_flag
        
        last_pos = pos
        data = {"line1": f"🎵 {tit} - {art}" if tit else "Idle", "line2": active_lyric, "line3": l3, "line4": f"💬 {msg_ovr}", "line5": l5}
        out = "\n".join([data[k] for k in args.order if k in data])
        
        # Send update if content changed or if we need to refresh (every 1.5s)
        if out != last and (now_ts - last_send_time) > 1.1:
            send(out)
            last = out
            last_send_time = now_ts

    except: pass
    time.sleep(0.3) # Faster internal polling
