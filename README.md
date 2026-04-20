<div align="center">
  <a href="https://c-yassin.github.io/Fireweb/" target="_blank">
    <img width="180" src="https://github.com/C-Yassin/FlameGet/blob/main/flameget.svg" alt="FlameGet Logo">
  </a>
</div>
<h1 align="center">
  <img src="https://github.com/C-Yassin/FlameGet/blob/main/logo.svg" alt="FlameGet">
</h1>
<p align="center">
  <a href="https://aur.archlinux.org/packages/flameget"><img alt="AUR Package" src="https://img.shields.io/aur/version/flameget?color=blue&label=AUR&logo=arch-linux"></a>
  <a href="https://c-yassin.github.io/Fireweb/">
    <img alt="FlameGet Website" src="https://img.shields.io/badge/Project_Website-orange?&labelColor=gray&logo=firebase&logoColor=orange">
  </a>
  <a href="https://github.com/C-Yassin/flameget/releases/latest"><img alt="GitHub Release" src="https://img.shields.io/github/v/release/C-Yassin/flameget?color=greenlight&label=Latest%20Release"></a>
</p>

<a href="https://c-yassin.github.io/Fireweb/" target="_blank">
    <img alt="FlameGet Banner" src="https://github.com/C-Yassin/Fireweb/blob/main/screenshot_1.png"/>
</a>

## Description

[FlameGet](https://c-yassin.github.io/Fireweb/) is a modern, lightweight GTK4 download manager designed specifically for the Linux desktop. By wrapping the power of **Aria2**, **cURL**, and **yt-dlp** into a sleek graphical interface, FlameGet ensures your downloads are handled efficiently, organized instantly, and accelerated to the maximum.

## Features

- ⚡️ **Maximum Acceleration:** Multi-connection downloads powered by Aria2 and cURL.
- 🎥 **Media Extraction:** Seamless video and audio downloading via integrated yt-dlp.
- 🧲 **P2P File Sharing:** High-speed torrent downloading and background seeding.
- 🎨 **Modern Interface:** Built with GTK4 and Python for a beautiful, native Linux experience.
- 🌐 **Browser Integration:** Catch downloads directly from your web browser.
- 🌙 **Adaptive Design:** Full support for custom styling and Dark/Light modes.
- ❤️ **Free and Open Source:** Transparent, lightweight, and community-driven.

Please visit the [Project Website](https://c-yassin.github.io/Fireweb/) for more info.

## Installation

### FlatHub
```bash
Soon...
````

### Arch Linux (AUR)

FlameGet is officially available on the Arch User Repository (AUR). You can install it using your favorite AUR helper (like `yay` or `paru`):

```bash
git clone https://aur.archlinux.org/flameget.git
cd flameget
````
```bash
makepkg -si 
# Or for an easier build, use: ./build.sh
```
### Manual Installation

For other Linux distributions, ensure you have the required dependencies installed on your system:
`aria2`, `aria2p`, `pycurl`, `yt-dlp`, `gtk4`, `python`, `python-flask`, `python-gobject`, `python-requests`, `python-waitress`, `sockets`

1.  Clone the repository:
    ```bash
    git clone https://github.com/C-Yassin/FlameGet.git
    cd flameget
    ```
2.  Run the application (to test):
    ```bash
    python main.py
    ```
3.  Build the application:<br>
    *Windows (.exe) & Linux (.AppImage):*
    ```bash
    python build.py
    ```
## Browser Extensions

You can download the browser extension to integrate FlameGet natively with your browser. This bridge automatically intercepts downloads and sends them directly to the FlameGet desktop app.

<p align="center">
  <a href="https://chromewebstore.google.com/detail/flameget-integration/aimiiaimkiflihoccgfkjdpadboaldim">
    <img alt="Chrome Extension" src="https://upload.wikimedia.org/wikipedia/commons/e/e1/Google_Chrome_icon_%28February_2022%29.svg" height="48">
  </a>
  <a href="https://addons.mozilla.org/en-US/firefox/addon/flameget-integration/">
    <img alt="Firefox Add-on" src="https://upload.wikimedia.org/wikipedia/commons/a/a0/Firefox_logo%2C_2019.svg" height="48">
  </a>
</p>

## Screenshots

<div align="center"\>
  <picture\>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/C-Yassin/Fireweb/blob/main/screenshot_5.png"\>
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/C-Yassin/Fireweb/blob/main/screenshot_4.png"\>
    <img alt="FlameGet Interface" src="https://github.com/C-Yassin/Fireweb/blob/main/screenshot_5.png"\>
  </picture\>
</div\>

## Bug Report & Feedback

If you encounter any bugs, crashes, or unintended behavior, please report them via the `GitHub Issues` section. Provide as much context as possible (OS, desktop environment, and terminal logs) so they can be fixed quickly.

## Contribution

Contributions are always welcome\! Whether it's translating the app (`translations.json`), tweaking the CSS (`dark_style.css` / `light_style.css`), or adding new features via pull requests.

If you like my work, please consider giving the repository a ⭐ — thanks\! ❤️
