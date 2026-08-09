#!/usr/bin/python3
import subprocess
import sys

def main():
    message = ""
    title = "Confirm"
    button1_label = "Yes"
    button2_label = None
    button3_label = None

    # Parse arguments
    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i].startswith("--text="):
            message = args[i][7:]
        elif args[i].startswith("--title="):
            title = args[i][8:]
        elif args[i].startswith("--button1="):
            button1_label = args[i][10:]
        elif args[i].startswith("--button2="):
            button2_label = args[i][10:]
        elif args[i].startswith("--button3="):
            button3_label = args[i][10:]
        elif args[i] == "--text" and i + 1 < len(args):
            message = args[i + 1]
            i += 1
        elif args[i] == "--title" and i + 1 < len(args):
            title = args[i + 1]
            i += 1
        i += 1

    if not message:
        sys.exit(1)

    cmd = [
        "zenity", "--question",
        f"--title={title}",
        f"--text={message}",
        f"--ok-label={button1_label}",
        "--width=400"
    ]

    if button2_label:
        cmd.append(f"--extra-button={button2_label}")
    if button3_label:
        cmd.append(f"--extra-button={button3_label}")

    res = subprocess.run(cmd, capture_output=True, text=True)

    # Exit codes: 0 = OK/Yes, 1 = Cancel/No, 5 = extra button 1, 6 = extra button 2
    # stdout contains the label of extra button clicked
    if res.returncode == 0:
        sys.exit(0)  # First button (Yes/OK)
    elif res.returncode == 5:
        sys.exit(5)  # First extra button
    elif res.returncode == 6:
        sys.exit(6)  # Second extra button
    else:
        sys.exit(1)  # Cancel/No

if __name__ == "__main__":
    main()
