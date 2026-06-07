# zeroclaw-git

An AUR package for **ZeroClaw** — a fast, small, and fully autonomous AI assistant infrastructure built in Rust. This package compiles with **all features enabled by default**, providing native sandboxing, observability, browser control, and extensive messaging channel integrations.

## Built-In Features

The package compiles with the following comprehensive feature flags:

### 💬 Messaging & Integration Channels
- **`channels-full`**: Bundles all standard platform integrations including:
  - **Signal** (via `channel-signal`)
  - **Discord** (via `channel-discord`)
  - **Slack** (via `channel-slack`)
  - **Lark / Feishu** (via `channel-lark` / `channel-feishu`)
  - **Telegram** (via `channel-telegram`)
  - **Email** (via `channel-email`)
  - **Mattermost** (via `channel-mattermost`)
  - **IRC** (via `channel-irc`)
  - **iMessage** (via `channel-imessage`)
  - **DingTalk** (via `channel-dingtalk`)
  - **QQ** (via `channel-qq`)
  - **Bluesky** (via `channel-bluesky`)
  - **Twitter** (via `channel-twitter`)
  - **Reddit** (via `channel-reddit`)
  - **Notion** (via `channel-notion`)
  - **MQTT** (via `channel-mqtt`)
  - **Linq** (via `channel-linq`)
  - **Wati** (via `channel-wati`)
  - **Nextcloud** (via `channel-nextcloud`)
  - **Mochat** (via `channel-mochat`)
  - **WeCom** (via `channel-wecom`)
  - **WeCom WS** (via `channel-wecom-ws`)
  - **ClawdTalk** (via `channel-clawdtalk`)
  - **WhatsApp Cloud** (via `channel-whatsapp-cloud`)
  - **Voice Call** (via `channel-voice-call`)
- **`channel-matrix`**: Full Matrix protocol client integration.
- **`channel-nostr`**: Nostr protocol support.
- **`channel-wechat`**: WeChat (iLink CDN) protocol support.
- **`channel-line`**: LINE integration.
- **`whatsapp-web`**: WhatsApp Web client protocol wrapper.

### 🛡️ Security & Isolation
- **`sandbox-landlock`**: Linux Landlock sandbox driver.
- **`sandbox-bubblewrap`**: Sandbox execution wrapping using bubblewrap (`optdepends`).

### 📊 Observability
- **`observability-otel`**: OpenTelemetry trace and metric propagation.
- **`observability-prometheus`**: Local metric exposure via Prometheus endpoints.

### 🤖 Capabilities & Runtime
- **`browser-native`**: Headless browser automation via native Chromium interface.
- **`rag-pdf`**: PDF ingestion, parsing, and context matching for Retrieval-Augmented Generation.
- **`plugins-wasm`**: Portable plugin execution using compiled WebAssembly.
- **`hardware` & `peripheral-rpi`** (on ARM architectures): GPIO and hardware control layers.
- **`voice-wake`**: Local voice wake-word triggers using soundcard CPAL linkage.
- **`embedded-web`**: Native administrative dashboard served from the binary.
- **`memory-postgres`**: PostgreSQL persistence adapter support.
- **`webauthn`**: WebAuthn credential attestation and assertion.

## Installation

To build and install the package locally:

```bash
updpkgsums && makepkg -si
```
