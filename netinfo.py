#!/usr/bin/env python3
"""
netinfo: Professional network and system information CLI tool
Author: Bangkah <mdhyaulatha@gmail.com>
License: MIT
"""

import socket
import requests
import os

def get_local_ip():
    """Return the local (LAN) IP address."""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
            s.connect(("8.8.8.8", 80))
            return s.getsockname()[0]
    except Exception:
        return "-"

def get_public_info():
    """Return public IP and related info from ipinfo.io."""
    try:
        resp = requests.get("https://ipinfo.io/json", timeout=5)
        if resp.status_code == 200:
            return resp.json()
    except Exception:
        pass
    return {}

def main():
    """Main entry point: gather and print network/system info."""
    import platform

    local_ip = get_local_ip()
    info = get_public_info()
    public_ip = info.get("ip", "-")
    org = info.get("org", "-")
    asn = "-"
    if org and org.startswith("AS"):
        asn = org.split()[0]
    organization = org.split(" ", 1)[1] if org and org.startswith("AS") and len(org.split(" ", 1)) > 1 else org

    # Reverse DNS lookup
    try:
        reverse_dns = socket.gethostbyaddr(public_ip)[0]
    except Exception:
        reverse_dns = "-"

    # Network type estimation
    network_type = "Unknown"
    if organization:
        org_lower = organization.lower()
        if any(x in org_lower for x in ["telkomsel", "indosat", "xl", "tri", "smartfren", "mobile"]):
            network_type = "Mobile"
        elif any(x in org_lower for x in ["fiber", "indihome", "biznet", "myrepublic", "iconnet"]):
            network_type = "Fiber"
        elif any(x in org_lower for x in ["dsl", "speedy"]):
            network_type = "DSL"
        elif any(x in org_lower for x in ["wifi", "wireless"]):
            network_type = "Wireless"
        else:
            network_type = "ISP"

    # System info
    os_name = platform.system()
    kernel = platform.release()
    arch = platform.machine()
    hostname = platform.node()
    term_type = os.environ.get("TERM", "-")
    shell = os.environ.get("SHELL", "-")

    # VPN/Proxy detection (if available)
    vpn_proxy = info.get("privacy", {}).get("vpn", False) or info.get("privacy", {}).get("proxy", False)
    vpn_status = "Yes" if vpn_proxy else "No / Unknown"

    # IP version
    ip_version = "IPv4" if "." in public_ip else "IPv6"

    # Output
    print("User Network Info\n-----------------")
    print(f"Public IP    : {public_ip}")
    print(f"Local IP     : {local_ip}")
    print(f"IP Version   : {ip_version}")
    print(f"ASN          : {asn}")
    print(f"Organization : {organization}")
    print(f"Reverse DNS  : {reverse_dns}")
    print(f"Network Type : {network_type} (estimated from ASN)")

    print("\nSystem Info\n-----------")
    print(f"OS           : {os_name}")
    print(f"Kernel       : {kernel}")
    print(f"Architecture : {arch}")
    print(f"Hostname     : {hostname}")
    print(f"Terminal     : {term_type}")
    print(f"Shell        : {shell}")

    print("\nPrivacy\n-------")
    print(f"VPN / Proxy  : {vpn_status}")

    return

if __name__ == "__main__":
    main()
