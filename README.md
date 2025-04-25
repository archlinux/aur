# 📤 Telecord

**Export Discord chats (JSON + media) to Telegram using a simple CLI tool.**

> ⚠️ This tool depends on [`discord-chat-exporter-cli`](https://github.com/Tyrrrz/DiscordChatExporter) for exporting your Discord messages first. Make sure to install and use that before proceeding.

---

## 📦 What You Need First

### 1. Install [`discord-chat-exporter-cli`](https://github.com/Tyrrrz/DiscordChatExporter)

download a standalone binary from their [Releases](https://github.com/Tyrrrz/DiscordChatExporter/releases).

---

### 2. Export your Discord chat

```bash
discord-chat-exporter-cli export \
  -t "YOUR_DISCORD_TOKEN" \
  -c DISCORD_CHANNEL_ID \
  --media \
 -f Json \
  -o media.json
```

> This will create:
>
> - `media.json` – your exported messages
> - `media.json_Files/` – folder containing any media (images, attachments, etc.)

---

## 🛠 Installation

**Coming soon to:**

- [ ] AUR (Arch User Repository)
- [ ] Nix
- [ ] Other Linux distros

**Manual installation (for now):**

```bash
git clone https://github.com/Vinayydv3695/telecord
cd telecord
npm install
npm link
```

---

## 🚀 Usage

### Basic CLI Mode

```bash
telecord -f media.json -m media.json_Files -t <TELEGRAM_BOT_TOKEN> -c <CHAT_ID>
```

### Options

| Option              | Alias | Description                                     |
| ------------------- | ----- | ----------------------------------------------- |
| `--file <path>`     | `-f`  | Path to Discord JSON file                       |
| `--media <path>`    | `-m`  | Path to media folder (e.g., `media.json_Files`) |
| `--token <string>`  | `-t`  | Your Telegram bot token                         |
| `--chat <id>`       | `-c`  | Discord Channel ID (e.g., `-1001234567890`)     |
| `--delay <seconds>` | `-d`  | Delay between messages (default: 1)             |
| `--reverse`         | `-r`  | Send messages from newest to oldest             |
| `--verbose`         | `-v`  | Enable detailed logs                            |
| `--interactive`     |       | Launch step-by-step mode                        |

---

## 🧙 Interactive Mode

No need to remember flags. Just run:

```bash
telecord --interactive
```

You’ll be prompted step-by-step:

```
✔ Path to Discord JSON file
✔ Folder containing media files
✔ Telegram Bot token
✔ Telegram chat ID
✔ Delay between messages
✔ Send newest messages first?
✔ Enable verbose logging?
```

---

## 🧪 Example

```bash
telecord -f media.json -m media.json_Files -t 123456:ABCDEF123 -c -1009876543210 --delay 0.5 --reverse
```

---

## ⚙️ How It Works

1. You export your messages from Discord using `discord-chat-exporter-cli`
2. Telecord parses the `.json` file
3. Media files are uploaded first
4. Messages are then sent one-by-one to your Telegram chat
5. You can control the delay, order, and see progress in real-time

It uses:

- Telegram's Bot API (via [Axios](https://github.com/axios/axios))
- Graceful error handling
- Verbose logging for debugging

---

## 📸 Screenshots

<!-- Paste screenshots and videos here -->

---

## 🧾 License

MIT License

```
Copyright (c) 2025 Vinay

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

---

## 👤 Author

Made with ❤️ by **Vinay**  
[GitHub](https://github.com/Vinayydv3695)
