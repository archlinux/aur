
# netinfo

![AUR version](https://img.shields.io/aur/version/netinfo?style=flat-square)
![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)

**netinfo** is a fast, minimal, and reliable command-line utility to display your network and system information. Designed for troubleshooting, auditing, scripting, or simply checking your connection status, netinfo only shows verifiable and essential data.

---

## Features

- Show public and local IP addresses
- Detect ASN and organization/ISP
- Reverse DNS lookup
- Estimate network type (Mobile/Fiber/DSL/Wireless/ISP)
- Display system info: OS, kernel, architecture, hostname, terminal, shell
- Detect VPN/proxy status (if available)

---

## Installation

### From AUR (Arch User Repository)
```sh
yay -S netinfo
```

### Manual (local build)
```sh
git clone https://github.com/Bangkah/netinfo.git
cd netinfo
makepkg -si
```

---

## Usage

```sh
netinfo
```

No options are required. The tool always outputs a full, structured report.

### Example Output
```
User Network Info
-----------------
Public IP    : 114.122.19.115
Local IP     : 192.168.8.191
IP Version   : IPv4
ASN          : AS23693
Organization : PT. Telekomunikasi Selular
Reverse DNS  : -
Network Type : ISP (estimated from ASN)

System Info
-----------
OS           : Linux
Kernel       : 6.18.6-zen1-1-zen
Architecture : x86_64
Hostname     : atha-ANV16-71-79NR
Terminal     : xterm-256color
Shell        : /usr/bin/zsh

Privacy
-------
VPN / Proxy  : No / Unknown
```

---

## Contributing

Pull requests, issues, and suggestions are welcome! Please ensure your changes are clear and well-tested. See PKGBUILD and LICENSE for details.

## License

MIT. See LICENSE file for details.

---

**Maintainer:**

- Bangkah mdhyaulatha@gmail.com

---

Links: [AUR netinfo](https://aur.archlinux.org/packages/netinfo) | [GitHub](https://github.com/Bangkah/netinfo)

