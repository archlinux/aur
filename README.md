# qtel-svxlink-git

**Qtel** (EchoLink client) built from the official [SvxLink](https://github.com/sm0svx/svxlink) Git repository.

This AUR package installs **only** the `qtel` graphical client — not the full SvxLink suite.

---

## 📦 Package Info

- **Name**: `qtel-svxlink-git`
- **Upstream**: [https://github.com/sm0svx/svxlink](https://github.com/sm0svx/svxlink)
- **Maintainer**: 9M2PJU <9m2pju@hamradio.my>
- **Provides**: `qtel`
- **Conflicts**: `qtel`, `qtel-git`, `qtel-svxlink`, `svxlink`
- **Architecture**: `x86_64`
- **License**: GPL

---

## ✅ Features

- Automatically tracks the latest **upstream Git commits**
- Installs only the `qtel` binary:
  - `/usr/bin/qtel`
- Clean: no daemons, no server-side modules, no docs
- Seamlessly integrates into **HamRadio menu** (confirmed on CachyOS)

---

## 🔧 Installation

Using an AUR helper like `paru`:

```bash
paru -S qtel-svxlink-git
```

Or build manually:

```bash
git clone https://aur.archlinux.org/qtel-svxlink-git.git
cd qtel-svxlink-git
makepkg -si
```

---

## ❓ What is Qtel?

`qtel` is a modern **EchoLink** client that allows amateur radio operators to communicate over the internet using VoIP. It supports text messaging, conferencing, and node connection via EchoLink servers.

This package is for those who **only want the GUI client** without the full SvxLink server stack.

---

## 🚫 Not Included

This package deliberately excludes:

- `svxlink` server daemon
- `remotetrx`, `siglevdetcal`, `svxreflector`
- Any `libasynccpp` or `libecholib` headers/libraries
- `/etc`, `/var`, man pages, and docs

---

## 📡 For Real Hams

This is ideal for ham radio operators using Arch-based systems who want a clean, lightweight Qtel install with no server baggage.

---

## ✍️ Notes

- Automatically picked up in HamRadio menu categories on systems like **CachyOS**, **Garuda**, etc.
- You can safely install this alongside other ham radio tools without conflict.

---

### 73 de 9M2PJU
