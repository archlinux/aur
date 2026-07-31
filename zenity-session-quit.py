#!/usr/bin/python3
import argparse
import os
import subprocess
import sys

def main():
    parser = argparse.ArgumentParser(description="Zenity Session Quit Dialog")
    parser.add_argument("--logout", action="store_true")
    parser.add_argument("--power-off", action="store_true")
    parser.add_argument("--reboot", action="store_true")
    parser.add_argument("--force", action="store_true")
    parser.add_argument("--no-prompt", action="store_true")
    args, _ = parser.parse_known_args()

    username = os.environ.get("USER") or subprocess.check_output(["whoami"]).decode().strip()

    # Handle direct execution without prompt
    if args.no_prompt:
        if args.reboot:
            subprocess.run(["systemctl", "reboot"])
        elif args.power_off:
            subprocess.run(["systemctl", "poweroff"])
        elif args.logout:
            subprocess.run(["pkill", "-u", username, "-f", "cinnamon-session"])
        sys.exit(0)

    # If specifically invoked with --logout
    if args.logout and not (args.power_off or args.reboot):
        cmd = [
            "zenity", "--question",
            "--title=Log Out",
            "--text=Are you sure you want to log out of your session?",
            "--ok-label=Log Out",
            "--cancel-label=Cancel",
            "--width=350"
        ]
        res = subprocess.run(cmd)
        if res.returncode == 0:
            subprocess.run(["pkill", "-u", username, "-f", "cinnamon-session"])
        sys.exit(0)

    # General Power / Quit Dialog
    cmd = [
        "zenity", "--question",
        "--title=System Power",
        "--text=What would you like to do?",
        "--ok-label=Shut Down",
        "--cancel-label=Cancel",
        "--extra-button=Restart",
        "--extra-button=Log Out",
        "--width=350"
    ]

    res = subprocess.run(cmd, capture_output=True, text=True)
    output = res.stdout.strip()
    err_output = res.stderr.strip()

    if res.returncode == 0:
        subprocess.run(["systemctl", "poweroff"])
    elif output == "Restart" or err_output == "Restart":
        subprocess.run(["systemctl", "reboot"])
    elif output == "Log Out" or err_output == "Log Out":
        subprocess.run(["pkill", "-u", username, "-f", "cinnamon-session"])

if __name__ == "__main__":
    main()
