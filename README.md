# ssh_tunnel_egui

A simple and modern GUI tool for managing SSH SOCKS5 tunnels, built with Rust and [`eframe/egui`](https://github.com/emilk/egui).
Supports secure password authentication (via `sshpass`), live connection status, and system tray integration.

## ✨ Features

- Connect to SSH servers via SOCKS5 proxy
- GUI interface to set:
  - Host / Port
  - Username
  - Password (hidden input)
- Uses `sshpass` to pass password securely
- Connect / Disconnect buttons
- Live connection status display
- System tray icon support (for Linux)
- Defaults fallback if fields are left empty

## 📷 Screenshots

*(Add screenshots here if available)*

## 🔧 Dependencies

- [Rust](https://www.rust-lang.org/) (edition 2021+)
- [sshpass](https://linux.die.net/man/1/sshpass) installed on system
- [egui](https://github.com/emilk/egui) via `eframe`
- [tray-icon](https://crates.io/crates/tray-icon) (Linux tray icon)

## 🚀 How to Build

```bash
git clone git@github.com:Paul-sinbud2004/ssh_tunnel_egui.git
cd ssh_tunnel_egui
cargo build --release
```

The binary will be under target/release/ssh_tunnel_egui.

## ✅ Run

Make sure sshpass is installed (e.g., sudo pacman -S sshpass on Arch):

./target/release/ssh_tunnel_egui

## 📁 Project Structure

src/
  main.rs        # GUI + backend logic
assets/          # (Optional) Tray icon and other resources
Cargo.toml       # Dependencies and metadata

## 🛠️ Future Improvements

- Cross-platform tray icon (Windows/macOS)

- Save recent server settings

- Auto-reconnect on disconnect

- Encrypted config storage

- Log window for debugging SSH output

## 📄 License

MIT License © 2025 Paul-sinbud2004