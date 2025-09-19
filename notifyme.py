#!/usr/bin/env python3
import sys
import time
import datetime
import subprocess

def send_notification(message):
    subprocess.run(["notify-send", message])

def main():
    if len(sys.argv) < 3:
        print("Usage: notifyme <HH:MM> <message>")
        sys.exit(1)

    target_time = sys.argv[1]
    message = " ".join(sys.argv[2:])

    # Parse the target time
    try:
        target_hour, target_minute = map(int, target_time.split(":"))
    except ValueError:
        print("Time format must be HH:MM (24-hour)")
        sys.exit(1)

    while True:
        now = datetime.datetime.now()
        if now.hour == target_hour and now.minute == target_minute:
            send_notification(message)
            break
        time.sleep(20)  # check every 20 seconds

if __name__ == "__main__":
    main()

