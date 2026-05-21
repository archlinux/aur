# FastFlowLM-gtk

**FastFlowLM-gtk** is a lightweight, high-performance, and native interface for the [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM) local LLM engine. Designed specifically for Linux power users, it leverages **GTK 4** and **Libadwaita** to deliver a fluid, distraction-free chat experience.

---

## 💡 The Philosophy: "Download and Chat"
We believe interacting with local AI should be effortless. FastFlowLM-gtk is designed to remove the friction of complex setups:
1. **Launch:** Open the app.
2. **Select:** Pick a model from the built-in registry.
3. **Download:** One click downloads and prepares the model for you.
4. **Chat:** Start typing instantly. 

That's it. No complicated server configurations, no browser overhead—just pure, local AI power.

---

## 🚀 Key Features

### 💬 Intuitive Chat Interface
*   **Markdown Rendering:** Bold, code blocks, and lists are formatted beautifully in the chat.
*   **Vision Support:** Easily attach images to VLMs (Vision Language Models) to analyze content.
*   **Native Feel:** Perfectly at home on your Linux desktop with Libadwaita aesthetics.
*   **Distraction-Free:** No tracking, no cloud accounts, and no Electron bloat.

### 📂 Session Intelligence
*   **Auto-Save:** Your conversations are kept safe automatically.
*   **Searchable History:** Quickly find past chats using the built-in sidebar search.
*   **Smart State:** The interface manages everything, so you don't break sessions mid-thought.

### 🛠 Powerful System Control
*   **Resource Monitoring:** Real-time RAM awareness prevents system freezes.
*   **Model Management:** Download, update, or repair model files directly from within the application.
*   **Dynamic Theming:** Automatically adapts to your system's accent color preferences.

---

## 🏗 Architectural Philosophy
The app follows a clean modular design, keeping the interface snappy and the backend robust:
*   **Orchestration (`main.py`):** The clean "brain" that keeps everything synchronized.
*   **Events (`handlers.py`):** All clicks, keyboard inputs, and state changes are centralized for predictability.
*   **System (`models.py` & `network.py`):** Handles model downloads, server lifecycle, and communication with the inference engine.

---

## 🛠 Setup & Installation

### Arch Linux (Recommended)
You can install the latest release directly from the Arch User Repository (AUR):
```bash
yay -S fastflowlm-gtk
```

### Manual Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/marleylinux/FastFlowLM-gtk
   cd FastFlowLM-gtk
   ```
2. **System Dependencies:**
   Ensure you have the required dependencies: `python`, `python-gobject`, `gtk4`, `libadwaita`, `libsoup3`, `gtksourceview5`, `python-psutil`, `fastflowlm`, and `webp-pixbuf-loader`.
3. **Installation:**
   Run the installation script to set up files, icons, and desktop entries:
   ```bash
   sudo ./install.sh
   ```

---

## 🔧 Troubleshooting

*   **Models Failing to Load:** Use the **Repair** (refresh) icon in the top header bar to force-reinstall a model if it seems corrupted.
*   **Black Images:** Ensure the `webp-pixbuf-loader` package is installed on your system to correctly render WebP icons/images.
*   **UI Sensitivity:** If buttons are disabled, check the system RAM status in the logs or wait for an active model download to finish.
*   **Performance:** For optimal performance, ensure you have sufficient RAM available as indicated by the app's internal checks.

---

## 🤝 Contribution
Contributions are encouraged! If you find a bug or have an idea, feel free to submit a Pull Request or open an issue on the GitHub repository.

*Powered by [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM).*
*Contact: warburtonmarley@proton.me*
