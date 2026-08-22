#!/usr/bin/python3
import subprocess
import sys

DEVICE_LABELS = {
    'HEADPHONES': 'Headphones',
    'HEADSET': 'Headset',
    'MICROPHONE': 'Microphone',
}

def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    device_names = sys.argv[1].split(',') if ',' in sys.argv[1] else sys.argv[1:]

    rows = []
    for name in device_names:
        key = name.strip().upper()
        label = DEVICE_LABELS.get(key, key.title())
        rows.append(key)
        rows.append(label)

    if len(rows) < 4:
        sys.exit(1)

    cmd = [
        'zenity', '--list',
        '--title=Select Audio Device',
        '--text=Choose an audio device:',
        '--radiolist',
        '--column=Device',
        '--column=Name',
        '--hide-header',
        '--width=350',
        '--height=200',
    ]

    for i, r in enumerate(rows):
        cmd.append(r)

    res = subprocess.run(cmd, capture_output=True, text=True)

    if res.returncode == 0 and res.stdout.strip():
        selected = res.stdout.strip().lower()
        print(selected)
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == '__main__':
    main()
