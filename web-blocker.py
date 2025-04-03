#!/usr/bin/env python3

"""
Web Blocker IP Resolver (Lightweight DNS-Based)
Dynamically resolve IPs using enhanced DNS techniques.
"""

import sys
import argparse
import dns.resolver
from concurrent.futures import ThreadPoolExecutor
import socket

# Expanded list of public DNS servers
PUBLIC_DNS = [
    "8.8.8.8", "8.8.4.4",         # Google
    "1.1.1.1", "1.0.0.1",         # Cloudflare
    "9.9.9.9", "149.112.112.112", # Quad9
    "208.67.222.222", "208.67.220.220", # OpenDNS
    "94.140.14.14", "94.140.15.15",     # AdGuard
    "4.2.2.1", "4.2.2.2",         # Level3
    "185.228.168.168", "185.228.169.168" # CleanBrowsing
]

def resolve_with_dnspython(domain, dns_server):
    """Resolve IPs using dnspython."""
    resolver = dns.resolver.Resolver()
    resolver.nameservers = [dns_server]
    ips = set()
    try:
        answers = resolver.resolve(domain, "A")
        for rdata in answers:
            ips.add(rdata.address)
    except Exception as e:
        print(f"Debug: dnspython failed for {domain} with {dns_server}: {e}", file=sys.stderr)
    return ips

def resolve_with_socket(domain):
    """Resolve IPs using socket as a fallback."""
    ips = set()
    try:
        ip = socket.gethostbyname(domain)
        ips.add(ip)
        print(f"Debug: Socket resolved {domain} -> {ip}", file=sys.stderr)
    except socket.gaierror as e:
        print(f"Debug: Socket failed for {domain}: {e}", file=sys.stderr)
    return ips

def get_ips(sites):
    """Resolve IPs dynamically with enhanced DNS."""
    all_ips = set()
    domains_to_check = set()

    # Generic subdomain prefixes
    common_prefixes = [
        "", "www", "api", "m", "svc", "media", "cdn", "static", "gateway"
    ]
    for site in sites:
        for prefix in common_prefixes:
            subdomain = f"{prefix}.{site}" if prefix else site
            domains_to_check.add(subdomain)

    # Step 1: Resolve with dnspython across multiple DNS servers
    with ThreadPoolExecutor(max_workers=20) as executor:
        future_to_domain = {
            executor.submit(resolve_with_dnspython, domain, dns_server): (domain, dns_server)
            for domain in domains_to_check
            for dns_server in PUBLIC_DNS
        }
        for future in future_to_domain:
            try:
                ips = future.result()
                all_ips.update(ips)
            except Exception as e:
                domain, dns_server = future_to_domain[future]
                print(f"Debug: DNS future failed for {domain} with {dns_server}: {e}", file=sys.stderr)

    # Step 2: Fallback with socket for additional coverage
    with ThreadPoolExecutor(max_workers=5) as executor:
        future_to_socket = {
            executor.submit(resolve_with_socket, domain): domain
            for domain in domains_to_check
        }
        for future in future_to_socket:
            try:
                ips = future.result()
                all_ips.update(ips)
            except Exception as e:
                domain = future_to_socket[future]
                print(f"Debug: Socket future failed for {domain}: {e}", file=sys.stderr)

    if not all_ips:
        print("Error: No IPs resolved.", file=sys.stderr)
        sys.exit(1)

    return all_ips

def main():
    """Handle command-line arguments."""
    parser = argparse.ArgumentParser(description="Web Blocker IP Resolver (Lightweight DNS-Based)")
    parser.add_argument("--get-ips", nargs="+", help="Resolve IPs for domains.")
    args = parser.parse_args()

    if args.get_ips:
        ips = get_ips(args.get_ips)
        print(" ".join(sorted(ips)))
    else:
        parser.print_help()
        sys.exit(1)

if __name__ == "__main__":
    main()