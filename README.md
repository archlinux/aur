# FastFlowLM-gtk

A modern, robust, and native GTK 4/Libadwaita graphical interface for the FastFlowLM engine.

## Features

### Chat Experience
*   **Serialized Messaging:** Strict input locking during AI processing to prevent session corruption.
*   **Automatic Focus:** The cursor automatically returns to the input bar after the AI finishes speaking.
*   **Rate-Limiting:** Built-in cooldowns with visual feedback (dimmed/disabled input bar) to ensure backend stability.
*   **Vision Support:** Send images directly into the chat with thumbnail previews.
*   **Markdown Formatting:** Rich text rendering for AI responses.

### Session Management
*   **Persistent History:** Auto-saving chat sessions to `~/.config/flm/history`.
*   **Searchable Sidebar:** Manage and search through past conversations with live message previews.
*   **Data Control:** Easily delete specific chats or clear your entire history.

### System & Customization
*   **Dynamic Model Picker:** Switch models easily with support for vision-model identification.
*   **Integrated Installer:** Download and install models directly from the GUI with progress tracking.
*   **Personalized Themes:** Custom accent colors that persist across sessions.
*   **System Resource Awareness:** RAM monitoring to prevent OOM errors when loading models.

## Installation & Running

1. **Clone the repository:**
   ```bash
   git clone https://github.com/marleylinux/FastFlowLM-gtk
   cd FastFlowLM-gtk
   ```

2. **Dependencies:** Ensure you have the necessary GNOME/Adwaita libraries installed.

3.  **Run the Application:**
    Simply execute:
    ```bash
    python3 app.py
    ```
    The application will automatically handle its own path configuration.

## Roadmap
*   Support for code-block syntax highlighting.
*   Chat export (Markdown/PDF).
*   Configurable AI model parameters (Temperature, Top-P).
*   System theme synchronization.
