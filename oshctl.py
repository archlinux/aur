#!/usr/bin/env python3
import os
import sys
import socket

SOCKET_PATH = "/run/oshd.sock"
OSHD_PATH = "/usr/bin/oshd"  # Adjust path to your oshd executable if needed

def is_daemon_running():
    return os.path.exists(SOCKET_PATH)

def send_via_socket(command):
    try:
        client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        client.connect(SOCKET_PATH)
        client.sendall(command.encode())
        response = client.recv(1024)
        print(response.decode())
        client.close()
        return True
    except Exception as e:
        print(f"Failed to connect to daemon: {e}")
        return False

def run_one_shot(command_args):
    print("oshd is not running, starting oshd.")
    print("It is reccomended to enable oshd to start on boot.")
    os.system("systemctl start oshd")
    main()

def main():
    if len(sys.argv) < 2:
        print("Usage: oshctl <command>")
        sys.exit(1)

    command_args = sys.argv[1:]
    command_line = " ".join(command_args)

    if is_daemon_running():
        if not send_via_socket(command_line):
            # Fallback to one-shot if socket fails
            run_one_shot(command_args)
    else:
        run_one_shot(command_args)

if __name__ == "__main__":
    main()
