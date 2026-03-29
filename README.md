# qbtctl
[![Release](https://img.shields.io/github/v/release/creptic/qbtctl)](https://github.com/creptic/qbtctl/releases)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.com/paypalme/crepticdev)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
[![AUR Version](https://img.shields.io/aur/version/qbtctl?label=AUR)](https://aur.archlinux.org/packages/qbtctl)
---

**qbittorrent torrent control** is a minimal, ultra-fast command-line interface for controlling a torrent in qBittorrent via its Web API.

It allows you to manage torrents directly from the terminal, supporting operations such as:

- Adding, resuming, stopping, and removing torrents  
- Setting categories, tags, sequential download, and superseeding 
- Monitoring torrent upload/download limits, state, and seed time  
- Interactive authentication setup or command-line credentials  
- Binary runs in Docker
  
Designed to be **compact**, making it easy to compile, deploy, and run.

Lightweight, fits on a floppy, yet powerful — perfect for scripting or managing your qBittorrent instance from the terminal.

## 📥 Download

Download the latest **precompiled binary (x86 / x86_64 Linux / Docker)**
```bash
wget https://github.com/creptic/qbtctl/releases/latest/download/qbtctl
chmod +x qbtctl
```
https://github.com/creptic/qbtctl/releases/latest/download/qbtctl

Install from [AUR](https://aur.archlinux.org/packages/qbtctl-bin/) with: ``yay qbtctl`` or use ``yay qbtctl-bin`` for binary.  

---

## 💡 **Quick Reference**

Most common commands and flags are listed in the [**Options**](#options) section below.  

---

# Requirements for Compiling

Before compiling `qbtctl`, ensure your system has:

- **C compiler** (`cc`, `gcc`, or `clang`)
- **libcurl** (for connecting to qbittorent api)
- **libsodium** (for encrypting/decrypting password)
- mbedtls (static build only) 
- POSIX-compatible OS (Linux, macOS, etc.)

Makefile and PKGBUILD are included.

Compile with: 

```bash
make
or
make static (optional static portable build)
make install (optional install to /usr/bin, may require sudo)
```
or use PKGBUILD with ``makepkg -i``

For a portable [**static build using Docker**](#static-build-using-docker), see the Docker section below.

---

# Clone make and run

```bash
git clone https://github.com/creptic/qbtctl.git
cd qbtctl
make
./qbtctl --setup
```
---

# Authentication Setup

`qbtctl` requires qBittorrent Web API credentials.

Credentials can be provided:

- via **auth.txt** (or a file saved with --setup using then using -c filename)
- via **command-line arguments** (overides file credentials)

Auth file search order:

1. `~/.qbtctl/auth.txt`
2. `./auth.txt` (inside the qbtctl directory)
3. Custom path using `-c <path>` (overrride)

Run:

```bash
./qbtctl --setup
```
You will be prompted for:

- qBittorrent URL (default: `http://localhost`)
- Port (default: 8080)
- Username
- Password

Note: To save to program directory just type ```auth.txt``` or alternate filename, when saving in -i or --setup

- Use full filename when saving, it will not create if pointed to a directory only.
      
By default credentials are saved to: ``~/.qbtctl/auth.txt``

---
# 💡 Usage Examples
These examples assume you have already set up credentials with `./qbtctl --setup`.

## 1. Adding a torrent/magnet 
Add a torrent file, set sequential download on, and return name.
```bash
./qbtctl --add torrent.file --set-seqdl 1 -gn
```
Add a magnet link, set ratio 2.0, set seedtime to 4 days
```bash
./qbtctl --add "magnet:?xt=urn:btih:0123456..." -srl 2.0 -sst 04:00:00
```

## 2. Watch all torrents 
Requires a tty, (may scroll spam in some terminals)

* Tested and working with Linux TTY and Konsole in Plasma.
```bash
./qbtctl -w
```

**Example output:**

```
Active torrents: 3 | Total DL: 28.6M | Total UL: 1.4M

+-------------------------------------+--------+----------+------+----------+----------+----------+----------+----------+--------------------+--------------+-----------+
|  Name                               | Hash   |     Size | Prog |      ETA |       DL |       UL | Download |   Upload | Tags               | Category     | State     |
+-------------------------------------+--------+----------+------+----------+----------+----------+----------+----------+--------------------+--------------+-----------+
| ubuntu-24.04-desktop-amd64.iso      | 969bd1 |    4.76G |  63% | 00:18:42 |       0B |       0B |    2.76G |    55.1M | Linux, ISO         | linux        | stalledUP |
| archlinux-2026.03.01-x86_64.iso     | 393166 |  895.39M |  92% | 00:02:11 |       0B |       0B |  395.69M |    89.4M | Linux, ISO         | linux        | stalledUP |
| debian-12.10.0-amd64-netinst.iso    | 8d8a89 |    1.06G | 100% | 00:00:00 |       0B |       0B |    1.06G |   312.7M | Linux, ISO         | linux        | stalledUP |
| linuxmint-22-cinnamon-64bit.iso     | 70fa97 |    2.92G |  37% | 00:42:15 |       0B |       0B |    1.92G |    12.4M | Linux, ISO         | linux        | stalledUP |
+-------------------------------------+--------+----------+------+----------+----------+----------+----------+----------+--------------------+--------------+-----------+
|       Press <Ctrl>+c to quit        |
+-------------------------------------+

```

## 3. Show all torrents

```bash
./qbtctl -a
```

```text

+------------------------------------------+--------+--------------+--------------+--------------+--------------+--------------+----------+------------------+
| Name                                     | Hash   | UL Limit(Kb) | DL Limit(Kb) | State        | Seed Time    | Limit D:H:M  | Category | Tags             |
+------------------------------------------+--------+--------------+--------------+--------------+--------------+--------------+----------+------------------+
| Ubuntu.ISO                               | 9c3289 | 0            | 0            | stalledUP    | 01:01:01     | 04:04:04     | ISO      | ISO, Debian      |

```

With raw output (bytes, seconds, true/false):

```bash
./qbtctl -r -a
```

```text
+------------------------------------------+--------+--------------+--------------+--------------+--------------+--------------+----------+------------------+
| Name                                     | Hash   | UL Limit (b) | DL Limit (b) | State        | Seed Time    | Limit(secs)  | Category | Tags             |
+------------------------------------------+--------+--------------+--------------+--------------+--------------+--------------+----------+------------------+
| Ubuntu.ISO                               | 9c3289 | 0            | 0            | stalledUP    | 90104        | 360240       | ISO      | ISO, Debian      |

```

---

## 4. Show single torrent info (with or without raw)

```bash
./qbtctl -s -h 9c3289
```

**Example output:**

```text
+------------------------------------------+
Name: Ubuntu.ISO
Hash: 9c3289027f9760e0f3fcfd2df40e0d80b2350191
Tags: ISO, Debian
Category: ISO
Upload Limit: 0
Download Limit: 0
Full Path: /incoming/Ubuntu.iso
Ratio Limit: 99.99
Seedtime: 01:01:01
Seedtime Limit: 04:04:04
Sequential Download: 0
Auto TMM: 0
Superseed: 0
Tracker: http://tracker.foo.com
Private: 0
Ratio: 0.20
Upload Speed: 91.50K
Download Speed: 0
Size: 1.98G
Uploaded: 404.07M
Downloaded: 1.98G
ETA: 100:00:00
State: uploading
Progress: 100%
+------------------------------------------+

```

With raw JSON:

```bash
./qbtctl -sj -h 1562EG
```

```json
{"name":"ARCH.ISO","state":"stalledUP","dl_limit":1048576,"ul_limit":524288,"ratio":2.0,"seed_time":45296,....etc}
```

---

## 5. Modify torrent settings

Set category and tags:

```bash
./qbtctl -sc Linux -st Linux,ISO -h 9c3289
```

Set upload and download limits:

```bash
./qbtctl -sul 1024 -sdl 2048 -h 9c3289
```

Enable sequential download and superseed:

```bash
./qbtctl -ssd 1 -sss 1 -h 9c3289
```

---

## 6. Pause(stop), resume(start), or remove torrents

Pause a torrent:

```bash
./qbtctl -ap -h 9c3289
```

Resume a torrent:

```bash
./qbtctl -as -h 9c3289
```

Remove torrent (keep data):

```bash
./qbtctl -ar -h 9c3289
```

Delete torrent and data:

```bash
./qbtctl -del -h 9c3289
```

---

## 7. Move torrent data

```bash
./qbtctl -am /downloads/linux -h 9c3289
```

Moves the files to `/downloads/linux` on the server.

---

## 8. Quick non-interactive run

If you want to run commands directly with credentials:

```bash
./qbtctl --url http://localhost:8080 --user admin --pass mypass -a
```
---

# Options

```bash
-help, --help            Show help message
-i, --setup              Setup server credentials interactively
-w, --watch              Watch all torrent stats in real time
-c <path>                Alternate auth file path
-r, --raw                Raw output mode (bytes, seconds, true/false)
--url <url>              qBittorrent WebUI URL (ex: http://localhost:8080)
--user <user>            qBittorrent username (default: admin)
--pass <pass>            qBittorrent password (NULL allowed)
-h, --hash <hash>        Torrent hash (minimum 6 characters)
-a, --show-all           Show basic torrent info for all torrents
-c, --show-all-clean     Show torrents info (borderless output)
-aj, --show-all-json     Show all torrents info as JSON
-s, --show-single        Show single torrent info (requires hash)
-sj, --show-single-json  Show single torrent info as JSON (requires hash)
-v, --version            Show version and exit
```

---

# Actions (requires --hash)

```bash
-am <path>, --move <path>  Move torrent to <path> on the server
-as, --start               Start torrent
-af, --force-start         Force start torrent
-ap, --pause               Pause or stop torrent
-ar, --remove              Remove torrent (keeps data)
-del, --delete             Remove, and delete torrent and data
-add <file/magnet>, --add <file/magnet> Add torrent via file or magnet link
```

---
# Setters (requires --hash)
```bash
# Command                             Standard Input  --raw Input
-sc <cat>, --set-category <cat>       Linux           Linux
-st <tag>, --set-tags <tag>           Linux,ISO       Linux,ISO
-sul <#>, --set-up-limit <#>          512 (KB/s)      524288
-sdl <#>, --set-dl-limit <#>          1024 (KB/s)     1048576
-srl <#>, --set-ratio-limit <#>       2.0             2.0
-sst <#>, --set-seedtime-limit <#>    24:00:00        86400
-ssd <val>, --set-seqdl <val>         1 (ON)          true
-sat <val>, --set-autotmm <val>       0 (OFF)         false
-sss <val>, --set-superseed <val>     0 (OFF)         false
```
---
# Getters (requires --hash)

```bash
# Command                   Standard Output              --raw Output (bytes/secs/boolean)
-gn, --get-name             Ubuntu.ISO                   "Ubuntu.ISO"
-gt, --get-tags             Linux,ISO                    "Linux, ISO"
-gc, --get-category         Linux ISOs                   "Linux ISOs"
-gu, --get-up-limit         512K (Kb/Mb/Gb)              524288
-gd, --get-dl-limit         1024K (Kb/Mb/Gb)             1048576
-gdp, --get-dl-path         /downloads/linux/iso.iso     "/downloads/linux/iso.iso"
-gr, --get-ratio-limit      2.0                          2.0
-gs, --get-seedtime         12:34:56                     45296
-gsl,--get-seedtime-limit   24:00:00                     86400
-gsd, --get-seqdl           0 (OFF)                      false
-gat, --get-autotmm         0 (OFF)                      false
-gss, --get-superseed       1 (ON)                       true
-gtr, --get-tracker         tracker.example.com          "tracker.example.com:port/announce"
-gtl, --get-tracker-list    tracker1,tracker2            "udp.tracker1:port","tracker2:port"
-gp, --get-private          1 (YES)                      true
-gr, --get-ratio            0.2                          0.321596
-gus, --get-up-speed        3.65K (Kb/Mb/Gb)             3618 
-gds, --get-dl-speed        0 (Kb/Mb/Gb)                 0
-gsz, --get-size            1.98G (Kb/Mb/Gb)             2125170914
-gud, --get-uploaded        654.17M (Kb/Mb/Gb)           85946796
-gdd, --get-downloaded      1.98G                        2126201670
-ge, --get-eta              100:00:00 (100:00:00=inf.)   8640000
-gst, --get-status          ForcedUP                     "ForcedUP"
-gpr, --get-progress        100%                         1.000000
-ghl, --get-hash-list       9c3289,012345                9c3289000000000etc,012345678*
```
---
## ⚠ Exit / Error Codes

```bash
# Exit Codes for qbtctl
0  EXIT_OK            # Success
1  EXIT_LOGIN_FAIL    # Authentication failed
2  EXIT_FETCH_FAIL    # API fetch request failed
3  EXIT_SET_FAIL      # API set request failed
4  EXIT_BAD_ARGS      # Invalid command-line arguments
5  EXIT_FILE          # Invalid file operation
6  EXIT_ACTION        # Action failed 
``` 
Usage Example:
```
./qbtctl -a
if [ $? -ne 0 ]; then
    echo "[ERROR] qbtctl encountered an error!"
fi
```
Notes:

These codes are returned by the CLI when commands fail.

---

# Static Build Using Docker

Run this inside the source directory:

```bash
docker run --rm -v "$(pwd)":/out alpine:latest /bin/sh -c "
set -e

# Install build dependencies
apk add --no-cache build-base musl-dev zlib-static pkgconf wget tar libsodium-dev libsodium-static

# Build curl statically
cd /tmp
wget -q https://curl.se/download/curl-8.17.0.tar.gz
tar xzf curl-8.17.0.tar.gz
cd curl-8.17.0
./configure --disable-shared --enable-static --without-ssl --disable-ntlm --disable-ldap --disable-ldaps \
            --disable-ftp --disable-file --disable-dict --disable-telnet --disable-pop3 --disable-imap \
            --disable-smtp --disable-gopher --disable-manual --disable-psl --without-libpsl
make -j\$(nproc)

# Compile all qbtctl sources statically
cd /out
gcc -O2 -static -s \
-I/tmp/curl-8.17.0/include \
-L/tmp/curl-8.17.0/lib/.libs \
-o qbtctl qbtctl.c watch.c cJSON.c auth.c help.c \
-lcurl -lsodium -lz -lm -ldl -lpthread

# Set ownership to host user
chown $(id -u):$(id -g) /out/qbtctl

# Cleanup temp files
rm -rf /tmp/curl-8.17.0 /tmp/curl-8.17.0.tar.gz
"
```
---

# ☕ Support / Donate 
If you enjoy **qbtctl**, consider buying me a coffee

[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.com/paypalme/crepticdev)

---
# Notes
- No https support. 
- Special thank you to the cJSON drop in from https://github.com/DaveGamble/cJSON
---
