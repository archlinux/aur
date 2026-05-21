# FastFlowLM-gtk

**FastFlowLM-gtk** is a lightweight, high-performance, and native interface for the [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM) local LLM engine. Designed specifically for Linux power users, it leverages **GTK 4** and **Libadwaita** to deliver a fluid, distraction-free chat experience that avoids the massive resource overhead of browser-based or Electron applications.

---

## 🚀 Detailed Feature Set

### 💬 Intelligent Chatting
*   **Persistent & Synchronized:** Seamless message serialization keeps sessions consistent, even during intensive inference.
*   **Markdown Support:** Rich rendering of bold, code blocks, and lists directly in the conversation.
*   **Visual Attachments:** Drag-and-drop or file-selector support for vision-capable models (VLMs).
*   **Smart Focus:** Automatic cursor snapping to the input bar when the AI finishes responding, allowing for immediate follow-up.
*   **Real-time Streaming:** Native token-by-token streaming, optimized for latency with modern NPU-accelerated hardware.

### 📂 Session & History Management
*   **Auto-Persistence:** Every message is saved locally to `~/.config/flm/history`.
*   **Searchable Sidebar:** A responsive sidebar enables you to find specific information within your past conversations instantly.
*   **Easy Cleanup:** Tools to delete single sessions or clear the entire history database with a few clicks.

### 🛠 System Integration & Control
*   **Model Lifecycle:** Manage your model downloads directly within the app.
*   **System Awareness:** Real-time RAM monitoring and resource locking to prevent out-of-memory (OOM) crashes during local execution.
*   **Accent Theming:** Dynamic CSS injection allows the interface to respect your system's accent color preferences.
*   **Model Repair:** Built-in "Repair" functionality (refresh icon) to force-reinstall corrupted models without leaving the application.

---

## 🏗 Architectural Overview

The application is engineered as a clean, modular controller-service system:

| Module | Purpose |
| :--- | :--- |
| **`main.py`** | **Orchestrator:** Manages application state, lifecycle, and component initialization. |
| **`ui.py`** | **Layouts:** Defines the structure of the chat interface and sidebar widgets. |
| **`display.py`** | **Render Logic:** Manages chat bubble creation, system messages, and visual feedback. |
| **`handlers.py`** | **Interaction Logic:** Centralized event handling for keys, clicks, and state transitions. |
| **`models.py`** | **System Infrastructure:** Server process management, model downloading, and file system integrity. |
| **`network.py`** | **Communication:** Handles asynchronous API interactions with the `flm` server. |
| **`sessions.py`** | **Persistence:** Responsible for reading/writing session data and history metadata. |

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
   Ensure your system has the following installed:
   - `python`, `python-gobject`, `gtk4`, `libadwaita`, `libsoup3`, `gtksourceview5`, `python-psutil`, `fastflowlm`.
3. **Installation:**
   Run the installation script to set up files, icons, and desktop entries:
   ```bash
   sudo ./install.sh
   ```

---

## 🔧 Troubleshooting

*   **Models Failing to Load:** If a model fails to initialize, click the **Repair** (refresh) icon in the top header bar to re-download the model files.
*   **UI Sensitivity:** If the input bar is disabled, ensure a model is selected. If a backend server crash occurs, the UI will attempt to remain active; check the logs at `~/.config/flm/server.log`.
*   **Performance:** For optimal performance, ensure you have sufficient RAM available as indicated by the app's internal checks.

---

## 🤝 Contribution
Contributions are encouraged! If you find a bug or have an idea, feel free to submit a Pull Request or open an issue on the GitHub repository.

*Powered by [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM).*
*Contact: warburtonmarley@proton.me*
