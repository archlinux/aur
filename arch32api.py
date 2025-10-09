import subprocess

# Auxiliary functions
def _ydotool(cmd):
    subprocess.run(['ydotool'] + cmd, capture_output=True)

def key_down(key):
    _ydotool(['keydown', key])

def key_up(key):
    _ydotool(['keyup', key])

def key_press(key):
    _ydotool(['key', key])

def type_text(text):
    _ydotool(['type', text])

def key_combination(keys):
    _ydotool(['key', ':'.join(keys)])

# =============================================================================
# Main win32api functions
# =============================================================================

def GetCursorPos():
    result = subprocess.run(['xdotool', 'getmouselocation'], capture_output=True, text=True)
    x = int(result.stdout.split('x:')[1].split()[0])
    y = int(result.stdout.split('y:')[1].split()[0])
    return (x, y)

def SetCursorPos(x, y):
    _ydotool(['mousemove', str(x), str(y)])

def mouse_event(dwFlags, dx=None, dy=None, dwData=0, dwExtraInfo=0):
    if dx is not None and dy is not None:
        SetCursorPos(dx, dy)
    
    if dwFlags == 0x0002: _ydotool(['mousedown', '0xC0'])
    elif dwFlags == 0x0004: _ydotool(['mouseup', '0xC0'])
    elif dwFlags == 0x0008: _ydotool(['mousedown', '0xC1'])
    elif dwFlags == 0x0010: _ydotool(['mouseup', '0xC1'])
    elif dwFlags == 0x0020: _ydotool(['mousedown', '0xC2'])
    elif dwFlags == 0x0040: _ydotool(['mouseup', '0xC2'])

def keybd_event(bVk, bScan, dwFlags, dwExtraInfo=0):
    key_hex = f'0x{bVk:02X}'
    if dwFlags == 0x0000: _ydotool(['keydown', key_hex])
    elif dwFlags == 0x0002: _ydotool(['keyup', key_hex])
    else: _ydotool(['key', key_hex])

def MapVirtualKey(uCode, uMapType=0):
    vk_map = {
        0x01: 0x01, 0x02: 0x02, 0x08: 0x0E, 0x0D: 0x1C,
        0x1B: 0x01, 0x20: 0x39, 0x25: 0xCB, 0x26: 0xC8,
        0x27: 0xCD, 0x28: 0xD0, 0x41: 0x1E, 0x43: 0x2E,
        0x56: 0x2F, 0x58: 0x2D, 0x70: 0x3B, 0x71: 0x3C,
        0x72: 0x3D, 0x73: 0x3E, 0x74: 0x3F, 0x75: 0x40,
    }
    return vk_map.get(uCode, uCode)

def GetAsyncKeyState(vKey):
    result = subprocess.run(['xdotool', 'getmouselocation', '--shell'], capture_output=True, text=True)
    lines = result.stdout.strip().split('\n')
    state = int(lines[3].split('=')[1]) if len(lines) > 3 else 0
    return state & (1 << (vKey - 1)) != 0

def GetKeyState(nVirtKey):
    return GetAsyncKeyState(nVirtKey)

# =============================================================================
# Virtual key constants
# =============================================================================

VK_LEFT = 0x25
VK_UP = 0x26
VK_RIGHT = 0x27
VK_DOWN = 0x28
VK_RETURN = 0x0D
VK_SPACE = 0x20
VK_BACK = 0x08
VK_ESCAPE = 0x1B
VK_CONTROL = 0x11
VK_SHIFT = 0x10
VK_ALT = 0x12
VK_TAB = 0x09
VK_CAPITAL = 0x14
VK_HOME = 0x24
VK_END = 0x23
VK_INSERT = 0x2D
VK_DELETE = 0x2E
VK_F1 = 0x70
VK_F2 = 0x71
VK_F3 = 0x72
VK_F4 = 0x73
VK_F5 = 0x74
VK_F6 = 0x75
VK_F7 = 0x76
VK_F8 = 0x77
VK_F9 = 0x78
VK_F10 = 0x79
VK_F11 = 0x7A
VK_F12 = 0x7B