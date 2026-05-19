# FastFlowLM-gtk

A minimalist, modern desktop interface for [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM), built with GTK 4 and Libadwaita.

FastFlowLM-gtk provides a distraction-free, native Linux experience for interacting with local LLMs, focusing on a clean, responsive layout and seamless session management.

## Key Features

- **Intuitive UI:** Built using modern GNOME/Adwaita design principles.
- **Vision Support:** Full support for image attachments in vision-capable models, with interactive thumbnail previews.
- **Session Persistence:** All chats are automatically saved to `~/.config/flm/history`, with smart management and easy deletion.
- **Global Theming:** Customize your accent color, which persists across app restarts.
- **Real-time Status:** Includes a "Thinking..." indicator and system-resource-aware process management.
- **Searchable History:** Built-in search functionality with live message preview.
- **Model Management:** Select models dynamically and download them directly from the interface.
- **Markdown Support:** Professional-grade syntax highlighting and Markdown formatting in chat.

## Installation

### AUR (Recommended)
You can install this package using your favorite AUR helper:
```bash
yay -S fastflowlm-gtk
# OR
paru -S fastflowlm-gtk
```

### Manual Installation
If you prefer to build from source:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/marleylinux/FastFlowLM-GTK
   cd FastFlowLM-GTK
   ```

2. **Run the installer:**
   ```bash
   chmod +x install.sh
   sudo ./install.sh
   ```

## Dependencies

- **Backend:** [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM)
- **UI Toolkit:** `gtk4`, `libadwaita`
- **Logic:** `python`, `python-gobject`, `libsoup3`, `gtksourceview5`
