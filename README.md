<div align="center">

```
╔═══════════════════════════════════════╗
║         CSRF-AWARE BRUTE FORCER       ║
║         (SIMPLE BRUTE for WEB)        ║
╚═══════════════════════════════════════╝
```

# csrf-brute

**A Hydra-style, CSRF-aware web login brute forcer written in Python.**

[![AUR](https://img.shields.io/aur/version/csrf-brute?color=1793d1&label=AUR&logo=arch-linux)](https://aur.archlinux.org/packages/csrf-brute)
[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange)](https://archlinux.org/)
[![GitHub](https://img.shields.io/badge/GitHub-bishnu7babu-black?logo=github)](https://github.com/bishnu7babu/csrf-brute)

> ⚠️ **For authorized penetration testing and security research only. Do not use against systems you don't own or have explicit permission to test.**

</div>

---

## 📌 What is csrf-brute?

Most web brute-force tools fail silently against CSRF-protected login forms — they don't handle token rotation, so every attempt after the first one is rejected.

`csrf-brute` solves this. It automatically extracts the CSRF token from the login page, re-injects it on every request, and runs wordlist-based credential attacks — just like Hydra, but built for modern CSRF-protected web apps.

---

## ✨ Features

- 🔐 **Automatic CSRF token extraction & re-injection** on every attempt
- 🧾 **Hydra-style CLI** — familiar flags, minimal learning curve
- 📄 **Wordlist support** for both usernames and passwords
- ⏱️ **Configurable wait time** between attempts (evade basic rate limiting)
- 🔊 **Verbose mode** for real-time request/response debugging
- 🪶 **Lightweight** — pure Python, minimal dependencies

---

## 📦 Installation

### Via AUR (Arch Linux / Athena OS)

```bash
yay -S csrf-brute
```

### Manual Install

```bash
git clone https://github.com/bishnu7babu/csrf-brute.git
cd csrf-brute
pip install -r requirements.txt
python csrf_brute.py --help
```

---

## 🚀 Usage

```
usage: csrf-brute [-h] [-l USER] [-L USERS] [-p PASSWORD] [-P PASSWORDS] -u URL [-w WAIT] [-v]
```

### Options

| Flag | Long Form | Description |
|------|-----------|-------------|
| `-l` | `--user USER` | Single username |
| `-L` | `--users USERS` | Username wordlist file |
| `-p` | `--password PASSWORD` | Single password |
| `-P` | `--passwords PASSWORDS` | Password wordlist file |
| `-u` | `--url URL` | Target login URL |
| `-w` | `--wait WAIT` | Wait time between attempts (default: 1s) |
| `-v` | `--verbose` | Enable verbose output |
| `-h` | `--help` | Show help message |

---

## 🧪 Examples

**Single username + password wordlist:**
```bash
csrf-brute -l admin -P /usr/share/wordlists/rockyou.txt -u http://target.com/login.php
```

**Username + password wordlists (full spray):**
```bash
csrf-brute -L users.txt -P passwords.txt -u http://target.com/login.php -v
```

**With custom wait time (stealthy mode):**
```bash
csrf-brute -l admin -P passwords.txt -u http://target.com/login.php -w 3 -v
```

**Single credential test:**
```bash
csrf-brute -l admin -p password123 -u http://target.com/login.php
```

---

## ⚙️ How It Works

1. Sends a `GET` request to the target URL to fetch the login page
2. Parses the HTML response to extract the CSRF token (from hidden input fields)
3. Injects the extracted token into each `POST` login attempt
4. Repeats for every credential pair in the wordlist
5. Reports success/failure based on the response

This flow ensures the CSRF token is always fresh per request, bypassing token-rotation defenses.

---

## 🔧 Requirements

- Python 3.x
- `requests`
- `beautifulsoup4`

Install dependencies:
```bash
pip install requests beautifulsoup4
```

---

## 📁 Project Structure

```
csrf-brute/
├── csrf_brute.py       # Main tool
├── requirements.txt    # Dependencies
├── PKGBUILD            # AUR package build file
└── README.md
```

---

## 🛡️ Legal Disclaimer

This tool is intended **solely for authorized penetration testing, CTF challenges, and security research** on systems you own or have explicit written permission to test.

Unauthorized use against systems without consent is **illegal** and violates computer crime laws in most jurisdictions. The author takes no responsibility for misuse.

**Always get permission before testing.**

---

## 👤 Author

**Bishnu Babu** ([@bishnu7babu](https://github.com/bishnu7babu))

- 🐙 GitHub: [github.com/bishnu7babu/csrf-brute](https://github.com/bishnu7babu/csrf-brute)
- 🌐 Portfolio: [bishnu-babu-portfolio.vercel.app](https://bishnu-babu-portfolio.vercel.app)
- 📦 AUR: [csrf-brute](https://aur.archlinux.org/packages/csrf-brute)

---

## 🤝 Contributing

Pull requests are welcome. For major changes, open an issue first to discuss what you'd like to change.

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

<div align="center">

*Built for the security community. Use responsibly.*

</div>
