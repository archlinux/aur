#!/usr/bin/env python3
import socket
import sys

PORT = 5555
BUF = 4096

def host():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(("0.0.0.0", PORT))
    s.listen(1)
    print(f"[archchat] waiting on port {PORT} ...")

    conn, addr = s.accept()
    print("[archchat] connected:", addr)

    while True:
        data = conn.recv(BUF)
        if not data:
            break
        print("peer:", data.decode().strip())
        msg = input("> ")
        conn.sendall(msg.encode() + b"\n")

def join(ip):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((ip, PORT))
    print("[archchat] connected to host")

    while True:
        msg = input("> ")
        s.sendall(msg.encode() + b"\n")
        data = s.recv(BUF)
        if not data:
            break
        print("peer:", data.decode().strip())

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("usage:")
        print("  archchat.py host")
        print("  archchat.py join <ip>")
        sys.exit(1)

    if sys.argv[1] == "host":
        host()
    elif sys.argv[1] == "join":
        join(sys.argv[2])

