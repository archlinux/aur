#!/usr/bin/env python3
"""
GAMECHANGER - Hybrid Battery Monitor für Linux
"""

import os
import time
import subprocess
import sys
import select
import tty
import termios
import fcntl
import glob

# --- KONFIGURATION ---
LOW_LIMIT = 20
CRITICAL_LIMIT = 15
CHECK_INTERVAL = 30
WARN_COOLDOWN = 60
SYS_PATH = "/sys/class/power_supply/"

# ========== HYBRID ALERT SYSTEM ==========
class HybridAlertSystem:
    def __init__(self):
        self.openrgb_available = self.check_command("openrgb")
        self.led_paths = self.find_leds()
        self.blink_state = False
        
        self.print_status()
    
    def check_command(self, cmd):
        try:
            return subprocess.run(["which", cmd], capture_output=True).returncode == 0
        except:
            return False
    
    def find_leds(self):
        leds = []
        patterns = [
            "/sys/class/leds/*capslock*/brightness",
            "/sys/class/leds/*numlock*/brightness",
            "/sys/class/leds/*scrolllock*/brightness"
        ]
        
        for pattern in patterns:
            for path in glob.glob(pattern):
                if os.path.exists(path):
                    leds.append(path)
        
        return leds
    
    def print_status(self):
        print("="*60)
        print("🎮 GAMECHANGER - HYBRID ALERT SYSTEM")
        print("="*60)
        
        if self.openrgb_available:
            print("✅ OpenRGB gefunden → RGB-Modus aktiv")
        else:
            print("⚠️ OpenRGB nicht gefunden → nur LEDs/Notifications")
        
        if self.led_paths:
            print(f"✅ {len(self.led_paths)} Tastatur-LEDs gefunden")
        else:
            print("⚠️ Keine Tastatur-LEDs gefunden")
        
        print("-"*60)
    
    def set_led(self, led_path, state):
        try:
            with open(led_path, 'w') as f:
                f.write("1" if state else "0")
            return True
        except:
            return False
    
    def set_all_leds(self, state):
        for led in self.led_paths:
            self.set_led(led, state)
    
    def blink_leds(self, duration=3):
        print("   💡 LED-ALARM AKTIVIERT!")
        for _ in range(duration * 2):
            self.set_all_leds(self.blink_state)
            self.blink_state = not self.blink_state
            time.sleep(0.5)
        self.set_all_leds(False)
    
    def blink_openrgb(self, r, g, b, duration=3):
        print("   🎨 RGB-ALARM AKTIVIERT!")
        for _ in range(duration * 2):
            color = f"{r},{g},{b}" if self.blink_state else "0,0,0"
            subprocess.run([
                "openrgb", "--noautoconnect",
                "--device", "Keyboard",
                "--color", color
            ], capture_output=True)
            self.blink_state = not self.blink_state
            time.sleep(0.5)
        subprocess.run(["openrgb", "--noautoconnect", "--color", "0,255,0"], capture_output=True)
    
    def trigger_alert(self, device_name, level):
        print(f"\n🚨 ALARM: {device_name} bei {level}%!")
        
        if self.openrgb_available:
            self.blink_openrgb(255, 0, 0, 3)
        elif self.led_paths:
            self.blink_leds(3)
        else:
            print("   🔔 Nur Benachrichtigung (keine LEDs/RGB)")
        
        self.send_notification(device_name, level)
    
    def send_notification(self, device_name, level):
        if level <= 10:
            title = f"🚨 {device_name} CRITICAL!"
            msg = f"Only {level}% left! Charge immediately!"
        elif level <= 15:
            title = f"⚠️ {device_name}: {level}%"
            msg = "Battery low · Charge soon!"
        else:
            title = f"🔋 {device_name}: {level}%"
            msg = "Still enough for today."
        
        try:
            subprocess.run([
                "notify-send", "-a", "GameChanger", 
                "-u", "critical" if level <= 15 else "normal",
                "-i", "battery-low", title, msg
            ])
        except:
            pass

# ========== KEYBOARD CONTROLLER ==========
class KeyboardController:
    def __init__(self):
        self.old_settings = None
        self.setup_raw_mode()
    
    def setup_raw_mode(self):
        try:
            fd = sys.stdin.fileno()
            self.old_settings = termios.tcgetattr(fd)
            tty.setraw(fd)
            fl = fcntl.fcntl(fd, fcntl.F_GETFL)
            fcntl.fcntl(fd, fcntl.F_SETFL, fl | os.O_NONBLOCK)
        except:
            pass
    
    def restore_mode(self):
        try:
            fd = sys.stdin.fileno()
            if self.old_settings:
                termios.tcsetattr(fd, termios.TCSADRAIN, self.old_settings)
            fl = fcntl.fcntl(fd, fcntl.F_GETFL)
            fcntl.fcntl(fd, fcntl.F_SETFL, fl & ~os.O_NONBLOCK)
        except:
            pass
    
    def get_key(self):
        try:
            return sys.stdin.read(1)
        except (IOError, BlockingIOError):
            return ''
    
    def check_keypress(self, timeout=0):
        try:
            dr, dw, de = select.select([sys.stdin], [], [], timeout)
            return dr != []
        except:
            return False

# ========== AKKU ERKENNUNG ==========

def get_battery_devices():
    devices = []
    seen_names = set()
    
    if os.path.exists(SYS_PATH):
        for entry in os.listdir(SYS_PATH):
            if entry.startswith(("AC", "ADP", "ACAD")):
                continue
                
            dev_path = os.path.join(SYS_PATH, entry)
            cap_file = os.path.join(dev_path, "capacity")
            
            if not os.path.exists(cap_file):
                continue
                
            try:
                with open(cap_file, 'r') as f:
                    level = int(f.read().strip())
                
                status_file = os.path.join(dev_path, "status")
                charging = False
                if os.path.exists(status_file):
                    with open(status_file, 'r') as f:
                        status = f.read().strip().lower()
                        charging = status in ["charging", "full"]
                
                device_type, name = detect_device_type(entry)
                
                if charging:
                    icon = {
                        "mouse": "⚡🖱️", "keyboard": "⚡⌨️",
                        "controller": "⚡🎮", "headset": "⚡🎧",
                        "unknown": "⚡🔋"
                    }.get(device_type, "⚡🔋")
                else:
                    icon = {
                        "mouse": "🖱️", "keyboard": "⌨️",
                        "controller": "🎮", "headset": "🎧",
                        "unknown": "🔋"
                    }.get(device_type, "🔋")
                
                display_name = f"{icon} {name}"
                
                if display_name not in seen_names:
                    devices.append({
                        "name": display_name,
                        "level": level,
                        "charging": charging,
                        "type": device_type,
                        "icon": icon
                    })
                    seen_names.add(display_name)
            except:
                continue
    
    return devices

def detect_device_type(entry):
    entry_lower = entry.lower()
    if any(x in entry_lower for x in ["ps", "controller", "playstation", "dual"]):
        return "controller", "PS5 DualSense"
    if "hidpp_battery_0" in entry_lower:
        return "mouse", "Logitech G502 X"
    if "hidpp_battery_1" in entry_lower:
        return "keyboard", "Logitech G515"
    return "unknown", entry

def check_headset():
    try:
        usb = subprocess.run(["lsusb", "-d", "10d6:4801"], capture_output=True, text=True)
        return bool(usb.stdout.strip())
    except:
        return False

def get_device_count(devices):
    stats = {"mouse": 0, "keyboard": 0, "controller": 0, "headset": 0}
    for d in devices:
        if d['type'] in stats:
            stats[d['type']] += 1
    return stats

# ========== UI ==========

def create_ui(devices, alert):
    os.system('clear')
    
    stats = get_device_count(devices)
    
    print("="*60)
    print("🎮 GAMECHANGER - HYBRID ALERT SYSTEM")
    print("="*60)
    
    if alert.openrgb_available:
        print("🎨 RGB-Modus: 🟢 AKTIV")
    elif alert.led_paths:
        print(f"💡 LED-Modus: 🟡 AKTIV ({len(alert.led_paths)} LEDs)")
    else:
        print("🔔 Benachrichtigungs-Modus: 🟠 NUR POPUPS")
    
    print("-"*60)
    
    stat_parts = []
    if stats["mouse"] > 0:
        stat_parts.append(f"🖱️ Maus: {stats['mouse']}")
    if stats["keyboard"] > 0:
        stat_parts.append(f"⌨️ Tastatur: {stats['keyboard']}")
    if stats["controller"] > 0:
        stat_parts.append(f"🎮 Controller: {stats['controller']}")
    if stats["headset"] > 0:
        stat_parts.append(f"🎧 Headset: {stats['headset']}")
    
    if stat_parts:
        print(" | ".join(stat_parts))
    else:
        print("Keine Geräte gefunden")
    
    print("-"*60)
    print("🔋 BATTERY DEVICES:")
    
    for d in devices:
        level = d['level']
        icon = d['icon']
        name = d['name']
        
        if level == "??":
            bar = "⏳" * 10
            percent = "??"
        else:
            filled = int(level / 10)
            bar = "█" * filled + "░" * (10 - filled)
            percent = f"{level}%"
            
            if level <= CRITICAL_LIMIT and "PS5" in name:
                print(f"  {icon} {name}: {bar} {percent} ⚠️ CRITICAL!")
                continue
        
        print(f"  {icon} {name}: {bar} {percent}")
    
    print("-"*60)
    print("CONTROLS:")
    print("  q = Quit")
    print("="*60)
    print(f"⏳ Next check in {CHECK_INTERVAL} seconds")

# ========== MAIN ==========

def main():
    alert = HybridAlertSystem()
    kb = KeyboardController()
    
    last_scan = 0
    devices = []
    last_warn_time = {}
    
    try:
        while True:
            now = time.time()
            
            if now - last_scan > CHECK_INTERVAL:
                devices = get_battery_devices()
                if check_headset():
                    devices.append({
                        "name": "🎧 NUBWO G06 Wireless",
                        "level": "??",
                        "charging": False,
                        "type": "headset",
                        "icon": "🎧"
                    })
                last_scan = now
                
                ps5_level = None
                for d in devices:
                    if "PS5" in d['name'] and d['level'] != "??":
                        ps5_level = d['level']
                        break
                
                if ps5_level is not None and ps5_level <= CRITICAL_LIMIT:
                    alert.trigger_alert("PS5 DualSense", ps5_level)
                    last_warn_time["PS5"] = now
            
            create_ui(devices, alert)
            
            if kb.check_keypress(0.1):
                key = kb.get_key()
                if key == 'q':
                    break
            
            for d in devices:
                if d['level'] != "??" and d['level'] <= LOW_LIMIT and not d.get('charging'):
                    key = d['name']
                    if key not in last_warn_time or now - last_warn_time[key] > WARN_COOLDOWN:
                        if "PS5" not in key:
                            alert.send_notification(d['name'], d['level'])
                            last_warn_time[key] = now
            
            time.sleep(0.5)
            
    except KeyboardInterrupt:
        pass
    finally:
        kb.restore_mode()
        print("\n👋 Goodbye!")

if __name__ == "__main__":
    main()
