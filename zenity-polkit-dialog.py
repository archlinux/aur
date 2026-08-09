#!/usr/bin/python3
import subprocess
import sys

def main():
    title = "Authentication Required"
    text = ""
    kind = "password"

    args = sys.argv[1:]
    i = 0
    while i < len(args):
        arg = args[i]
        if arg.startswith("--title="):
            title = arg[8:]
        elif arg.startswith("--text="):
            text = arg[7:]
        elif arg == "--info":
            kind = "info"
        elif arg == "--error":
            kind = "error"
        i += 1

    if kind == "password":
        cmd = [
            "zenity", "--entry", "--hide-text",
            f"--title={title}",
            f"--text={text}",
            "--width=420",
        ]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode == 0:
            sys.stdout.write(res.stdout)
            sys.stdout.flush()
            sys.exit(0)
        else:
            sys.exit(1)
    elif kind == "info":
        cmd = ["zenity", "--info", f"--title={title}", f"--text={text}", "--width=420"]
        subprocess.run(cmd)
        sys.exit(0)
    else:
        cmd = ["zenity", "--error", f"--title={title}", f"--text={text}", "--width=420"]
        subprocess.run(cmd)
        sys.exit(0)

if __name__ == "__main__":
    main()
