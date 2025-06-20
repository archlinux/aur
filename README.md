<p align="center">
  <table>
    <tr>
      <td>
        <img src="docs/time-rs-cli.png" alt="Yoru Timer Logo" width="128" style="vertical-align: middle;"/>
      </td>
      <td>
        <h1 style="display: inline; vertical-align: middle; margin-left: 16px;">
          Time-RS CLI 
        </h1>
      </td>
    </tr>
  </table>
</p>


<h6 align="center" style="color:#bac2de;">
  A minimal Catppuccin-themed TUI countdown timer.
</h6>

<p align="center">
  <!-- GitHub Stars -->
  <a href="https://github.com/ryu-ryuk/yoru-timer-cli/stargazers">
    <img src="https://img.shields.io/badge/Stars-★%20%7C%20ryu--ryuk%2Fyoru--timer--cli-cba6f7?style=for-the-badge&labelColor=1e1e2e&color=cba6f7&logo=github&logoColor=cdd6f4" alt="GitHub Stars"/>
  </a>
  <!-- GitHub Issues -->
  <a href="https://github.com/ryu-ryuk/yoru-timer-cli/issues">
    <img src="https://img.shields.io/badge/Issues-Open-f38ba8?style=for-the-badge&labelColor=1e1e2e&color=f38ba8&logo=github&logoColor=cdd6f4" alt="GitHub Issues"/>
  </a>
  <!-- License -->
  <a href="https://github.com/ryu-ryuk/yoru-timer-cli/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-89b4fa?style=for-the-badge&labelColor=1e1e2e&color=89b4fa&logo=openaccess&logoColor=cdd6f4" alt="MIT License"/>
  </a>
</p>


<p align="center">
  <!-- Rust Edition -->
  <img src="https://img.shields.io/badge/Rust-2024--edition-89b4fa?style=for-the-badge&logo=rust&logoColor=white&labelColor=1e1e2e&color=89b4fa" alt="Rust 2024 Edition"/>
  <!-- Ratatui -->
  <img src="https://img.shields.io/badge/ratatui-Terminal_UI-b4befe?style=for-the-badge&logo=gnome-terminal&logoColor=white&labelColor=1e1e2e&color=b4befe" alt="ratatui Terminal UI"/>
  <!-- Theme -->
  <img src="https://img.shields.io/badge/Theme-Catppuccin_Mocha-f5c2e7?style=for-the-badge&logo=palette&logoColor=white&labelColor=1e1e2e&color=f5c2e7" alt="Catppuccin Mocha Theme"/>
  <!-- Platform -->
  <img src="https://img.shields.io/badge/Platform-Portable_(Linux/Mac/WSL)-a6e3a1?style=for-the-badge&logo=linux&logoColor=white&labelColor=1e1e2e&color=a6e3a1" alt="Platform Portable"/>
</p>


<p align="center" style="color:#a6adc8; font-size: 14.5px; line-height: 1.6; max-width: 700px; margin: auto;">
  <strong style="color:#cdd6f4;">Time-RS CLI</strong> is a highly minimal, distraction-free terminal countdown timer.<br/>
  Built in <span style="color:#89b4fa;">Rust</span> using <span style="color:#b4befe;">ratatui</span> and themed with <span style="color:#f5c2e7;">Catppuccin Mocha</span>.<br/>
  Perfect for Pomodoros, build pauses, CLI workflows, or just flexing nerdy timers in your terminal.
</p>

---

## 🎥 Preview

<p align="center">
  <img src="docs/preview.gif" alt="Preview of Yoru Timer TUI" width="85%"/>
</p>

---

## ⏳ Features

* ⌨️ TUI controls:
  - `r` — restart timer
  - `j/k` — add/subtract 10s
  - `h` — show/hide help
  - `esc` — close help
  - `q` — quit
  - `p` - pomodoro timer

* 🎨 Catppuccin Mocha theming (colors, borders, text)
* 🧠 Smart redraws and minimalist centered layout
* 🧱 Built using [`ratatui`](https://github.com/ratatui-org/ratatui) + `crossterm`
* 📦 Single binary, zero dependencies at runtime



## 🧪 Try Kitty Popup Mode

You can use a floating terminal like `kitty` to simulate a popup view: | Might not work :(

```sh
kitty --override initial_window_width=50c \
      --override initial_window_height=8c \
      ./yoru-timer-cli
```

## ⚙ Build 
```sh
git clone https://github.com/ryu-ryuk/yoru-timer-cli
cd yoru-timer-cli
cargo build --release
./target/release/yoru-timer-cli
```

## 🌫 Contributing

I welcome contributions! Whether it's bug fixes, new features, or improvements, feel free to open issues or submit pull requests.

### Development Setup
 
* Fork the repository.

* Clone your fork.

* Create a new branch for your feature or bugfix.

* Make your changes and commit with clear messages.

* Push your branch and open a pull request.

#### Thank you for helping make Time-RS CLI better! 💜