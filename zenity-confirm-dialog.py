#!/usr/bin/python3
import subprocess
import sys

def main():
    message = ""
    title = "Confirm"
    dialog_type = "question"  # default to question (Yes/No)

    # Parse arguments
    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i].startswith("--text="):
            message = args[i][7:]
        elif args[i].startswith("--title="):
            title = args[i][8:]
        elif args[i] == "--text" and i + 1 < len(args):
            message = args[i + 1]
            i += 1
        elif args[i] == "--title" and i + 1 < len(args):
            title = args[i + 1]
            i += 1
        elif args[i] == "--info":
            dialog_type = "info"
        i += 1

    if not message:
        sys.exit(1)

    if dialog_type == "info":
        cmd = [
            "zenity", "--info",
            f"--title={title}",
            f"--text={message}",
            "--ok-label=OK",
            "--width=350"
        ]
    else:
        cmd = [
            "zenity", "--question",
            f"--title={title}",
            f"--text={message}",
            "--ok-label=Yes",
            "--cancel-label=No",
            "--width=350"
        ]

    res = subprocess.run(cmd)
    sys.exit(res.returncode)

if __name__ == "__main__":
    main()
