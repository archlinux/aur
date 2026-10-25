#!/usr/bin/env python3
"""QMP touch helper for qemu-ios iPod touch (320x480 screen).
usage: ipod-input.py SOCK tap X Y | drag X1 Y1 X2 Y2 [steps] | key NAME | shot FILE.ppm | quit"""
import json, socket, sys, time
sock, cmd, *a = sys.argv[1:]
s = socket.socket(socket.AF_UNIX); s.connect(sock); f = s.makefile('rw')
def rx():
    while True:
        m = json.loads(f.readline())
        if 'return' in m or 'error' in m: return m
def tx(o): f.write(json.dumps(o) + '\n'); f.flush(); return rx()
json.loads(f.readline()); tx({'execute': 'qmp_capabilities'})
def ev(events): return tx({'execute': 'input-send-event', 'arguments': {'events': events}})
def pos(x, y): return [{'type': 'abs', 'data': {'axis': 'x', 'value': int(x * 32767 / 320)}},
                       {'type': 'abs', 'data': {'axis': 'y', 'value': int(y * 32767 / 480)}}]
def btn(d): return [{'type': 'btn', 'data': {'button': 'left', 'down': d}}]
if cmd == 'tap':
    x, y = map(float, a); ev(pos(x, y)); time.sleep(0.05); ev(btn(True)); time.sleep(0.15); ev(btn(False))
elif cmd == 'drag':
    x1, y1, x2, y2 = map(float, a[:4]); n = int(a[4]) if len(a) > 4 else 20
    ev(pos(x1, y1)); time.sleep(0.05); ev(btn(True)); time.sleep(0.1)
    for i in range(1, n + 1):
        ev(pos(x1 + (x2 - x1) * i / n, y1 + (y2 - y1) * i / n)); time.sleep(0.03)
    time.sleep(0.1); ev(btn(False))
elif cmd == 'key':
    print(tx({'execute': 'send-key', 'arguments': {'keys': [{'type': 'qcode', 'data': a[0]}], 'hold-time': 150}}))
elif cmd == 'shot':
    print(tx({'execute': 'screendump', 'arguments': {'filename': a[0]}}))
elif cmd == 'quit':
    print(tx({'execute': 'quit'}))
