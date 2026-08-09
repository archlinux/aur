#!/usr/bin/python3
import subprocess
import sys

def main():
    timeout = 15
    if len(sys.argv) > 1:
        try:
            timeout = int(sys.argv[1])
        except ValueError:
            pass

    cmd = [
        'zenity', '--question',
        '--title=Keep these display settings?',
        '--text=Reverting to previous display settings in %d seconds.' % timeout,
        '--ok-label=Keep changes',
        '--cancel-label=Revert',
        '--width=400',
        f'--timeout={timeout}',
    ]

    res = subprocess.run(cmd, capture_output=True, text=True)

    if res.returncode == 0:
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == '__main__':
    main()
