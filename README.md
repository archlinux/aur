<p align="center">
  <img src="public/header.jpg" alt="Luna AI OS Header" width="100%" />
</p>

<h1 align="center">🌙 Luna AI OS — Intelligent Desktop Assistant & Cybersecurity Companion</h1>

<p align="center">
  <b>Arunachalam's An advanced cybersecurity chatbot and intelligent desktop assistant for Arch Linux. Developed by a 7-year veteran builder based in (Tamil Nadu), India.</b>
</p>

<p align="center">
  <a href="https://aur.archlinux.org/packages/luna-gpt"><img src="https://img.shields.io/badge/AUR-luna--gpt-blue?style=for-the-badge&logo=archlinux" alt="AUR Package" /></a>
  <a href="https://github.com/Arunachalam-gojosaturo/Luna-gpt"><img src="https://img.shields.io/badge/License-MIT-green.style=for-the-badge" alt="License" /></a>
  <img src="https://img.shields.io/badge/Node.js-v18%2B-brightgreen?style=for-the-badge&logo=nodedotjs" alt="Node.js" />
  <img src="https://img.shields.io/badge/Arch_Linux-Compatible-cyan?style=for-the-badge&logo=archlinux" alt="Arch Linux" />
</p>

---

## ✨ Overview

**Luna AI OS** is a personalized, high-performance desktop assistant and cybersecurity research chatbot built natively for **Arch Linux** and Linux desktop environments. Designed by **Arunachalam**, a 7-year veteran builder from Tamil Nadu, India, Luna combines multi-provider LLM routing, real-time web research, in-chat live code previews, system file exploration, and persistent memory into a single dark-mode interface.

---

## 🚀 Key Features

- 🛡️ **Cybersecurity & Ethical Hacking Assistant**: Built-in support for security auditing, network scanning analysis, role-based access control (RBAC) remediation, and defensive code analysis.
- ⚡ **Universal 18-Provider LLM Router**: Seamlessly switch between **NVIDIA NIM API**, **Google Gemini**, **Groq**, **Hugging Face**, **OpenRouter**, **Together AI**, **Cohere**, **Mistral AI**, **Anthropic**, **OpenAI**, **DeepSeek**, **Cerebras**, **SambaNova**, **Replicate**, **AI21**, **Stability AI**, **Voyage AI**, **Perplexity**, or use the built-in **Free Engine**.
- 🌐 **In-Chat Live Web Research**: Perform real-time DuckDuckGo web searches directly inside chat threads with clickable source domain citations.
- ▶ **Real-Time Code Previews**: Render HTML/CSS/JS snippets directly within the chat window with one-click live web previews.
- 🧠 **Persistent User & Project Memory**: Auto-stores user preferences, tech stack context, and memory facts across sessions.
- 📂 **System Explorer Integration**: Open system directories (`xdg-open` / file managers) straight from the Files tab.
- 🎨 **Sleek Cyberpunk Aesthetics**: Modern dark mode UI with glassmorphism, responsive model dropdowns, and sticky provider headers.

---

## 📦 Installation & Setup

### Option 1: Install via AUR (`yay` on Arch Linux)

```bash
yay -S luna-gpt
```

Once installed, launch Luna AI from your terminal or application launcher:

```bash
luna-gpt
```

### Option 2: Run from Source

```bash
# 1. Clone the repository
git clone https://github.com/Arunachalam-gojosaturo/Luna-gpt.git
cd Luna-gpt

# 2. Install dependencies
npm install

# 3. Start the application server
npm start
```

Navigate to **`http://localhost:3001`** in your browser!

---

## ⚙️ Configuration & API Keys

You can use Luna out of the box with the **Free Engine**, or configure any of the **18 supported API providers** under **Settings**:

1. Click **Settings** in the left sidebar.
2. Enter your API Key for your preferred provider (NVIDIA NIM, Google Gemini, OpenRouter, DeepSeek, Anthropic, etc.).
3. Click **Save Configuration**. Your keys are encrypted and stored locally on your machine.

---

## 🛠️ Tech Stack

- **Backend**: Node.js, Express, Server-Sent Events (SSE), HTTP/HTTPS streaming
- **Frontend**: HTML5, Vanilla CSS, JavaScript (ES6+), Marked.js, Highlight.js
- **Search & Storage**: DuckDuckGo Scraper, JSON Local Storage Engine
- **Target OS**: Arch Linux, Hyprland / Sway / KDE / GNOME

---

## 👤 Author & Maintainer

Developed with ❤️ by **Arunachalam**  
*7-Year Veteran Software Builder & Security Researcher based in Tamil Nadu, India.*

- **GitHub**: [@Arunachalam-gojosaturo](https://github.com/Arunachalam-gojosaturo)
- **AUR Package**: [`luna-gpt`](https://aur.archlinux.org/packages/luna-gpt)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
