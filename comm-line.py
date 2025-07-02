#!/usr/bin/env python3

import socket
import threading
import argparse
import sys
import time
import pyfiglet
from colorama import Fore, Style, init

init(autoreset=True)

class Chat:
    def __init__(self, port=12345, name=None):
        self.port = port
        self.name = name or f"User-{socket.gethostname()}"
        self.peers = []  
        self.running = True
        
    def get_local_ip(self):
        """Get local IP address."""
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(('8.8.8.8', 80))
            ip = s.getsockname()[0]
            s.close()
            return ip
        except:
            return '127.0.0.1'
    
    def start_server(self):
        """Start server to receive messages."""
        try:
            server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            server.bind(('', self.port))
            server.listen(5)
            
            print(f"Listening on {self.get_local_ip()}:{self.port}")
            print(f"Your name: {self.name}")
            print("-" * 40)
            
            while self.running:
                try:
                    client, addr = server.accept()
                    threading.Thread(target=self.handle_client, args=(client, addr), daemon=True).start()
                except:
                    break
        except Exception as e:
            print(f"Server error: {e}")
    
    def handle_client(self, client, addr):
        """Handle incoming messages."""
        try:
            while self.running:
                data = client.recv(1024).decode('utf-8')
                if not data:
                    break
                print(f"[{addr[0]}] {data}")
        except:
            pass
        finally:
            client.close()
    
    def send_message(self, message):
        """Send message to all peers."""
        if not self.peers:
            print("No peers connected. Use 'connect <ip>' first.")
            return
            
        full_message = f"{self.name}: {message}"
        for ip, port in self.peers:
            try:
                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                s.settimeout(3)
                s.connect((ip, port))
                s.send(full_message.encode('utf-8'))
                s.close()
            except:
                print(f"Failed to send to {ip}")
        
        print(f"You: {message}")
    
    def connect_peer(self, ip, port=None):
        """Connect to a peer."""
        port = port or self.port
        try:
           
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.settimeout(5)
            s.connect((ip, port))
            s.close()
            
            
            if (ip, port) not in self.peers:
                self.peers.append((ip, port))
                print(f"Connected to {ip}:{port}")
            else:
                print(f"ℹ Already connected to {ip}:{port}")
        except:
            print(f"Failed to connect to {ip}:{port}")
    
    def show_peers(self):
        """Show connected peers."""
        if not self.peers:
            print("No peers connected")
        else:
            print(f"Connected peers ({len(self.peers)}):")
            for i, (ip, port) in enumerate(self.peers, 1):
                print(f"  {i}. {ip}:{port}")
    
    def handle_input(self):
        """Handle user input."""
        print("Chat ready! Commands: connect <ip>, peers, quit")
        print("-" * 40)
        
        while self.running:
            try:
                user_input = input().strip()
                if not user_input:
                    continue
                
                if user_input.lower() == 'quit':
                    self.running = False
                    break
                elif user_input.lower() == 'peers':
                    self.show_peers()
                elif user_input.startswith('connect '):
                    parts = user_input.split()
                    if len(parts) >= 2:
                        ip = parts[1]
                        port = int(parts[2]) if len(parts) > 2 else self.port
                        self.connect_peer(ip, port)
                    else:
                        print("Usage: connect <ip> [port]")
                else:
                    self.send_message(user_input)
            except KeyboardInterrupt:
                break
            except Exception as e:
                print(f"Error: {e}")
    
    def start(self):
        """Start the chat application."""
       
        threading.Thread(target=self.start_server, daemon=True).start()
        time.sleep(0.5)  
        
       
        self.handle_input()
        
        print("Goodbye!")


def main():
    ascii_banner = pyfiglet.figlet_format("$ COMM-LINE", font="slant")
    print(Fore.GREEN + ascii_banner)
    parser = argparse.ArgumentParser(description='Chat')
    parser.add_argument('--port', type=int, default=12345, help='Port (default: 12345)')
    parser.add_argument('--name', type=str, help='Your name')
    parser.add_argument('--peer', type=str, help='Connect to peer IP')
    
    args = parser.parse_args()
    
    chat = Chat(port=args.port, name=args.name)
    
    if args.peer:
        chat.connect_peer(args.peer)
    
    try:
        chat.start()
    except KeyboardInterrupt:
        print("\nGoodbye!")


if __name__ == "__main__":
    main()
