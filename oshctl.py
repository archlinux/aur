#!/usr/bin/env python3
import os
import sys
import socket
import pwd

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
    print("oshd daemon not found, did you enable/start it? attempting to use one-shot mode...")
    # Ensure we are root
    if os.geteuid() != 0:
        print("ERROR: must be run as root in one-shot mode")
        sys.exit(1)
    # Build command to execute oshd directly
    cmd = [OSHD_PATH] + command_args
    os.execv(OSHD_PATH, cmd)  # replaces current process

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
