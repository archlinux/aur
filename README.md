# OpenClaw Arch Linux Packaging

**OpenClaw** is an experimental personal AI assistant you run on your own devices. 
It connects to channels like WhatsApp, Signal, Telegram, and Slack, and can perform tasks on your behalf.

Refer to the [official documentation](https://docs.openclaw.ai) for comprehensive configuration guides.

This repository contains the `PKGBUILD` and helper scripts for the Arch Linux package.

> [!WARNING]
> **Security Risks**: OpenClaw executes code and interacts with your system.
> *   **Prompt Injection**: AI models can be tricked by malicious input (e.g., from a message in a connected chat) into performing unauthorized actions.
> *   **External Exposure**: Connecting OpenClaw to public messaging channels exposes your internal agent to the outside world.

## Bun Adjustments Patch

The `bun-adjustments.patch` modifies the upstream source to support the **Bun** runtime and improve the plugin/skill management experience on Arch Linux.

### Key Modifications:
- **Runtime Transition**: Replaces `pnpm` with `bun` across the entire build system and internal script runners.
- **Dependency Fixes**: Adds `node-gyp` to `devDependencies` to ensure native modules like `sharp` build correctly from source.
- **Improved UI Runner**: Updates `scripts/ui.js` to prioritize `bun` for managing the Control UI.
- **User-Centric Plugin Discovery**:
    - Adds support for discovering NPM-style plugins installed in the user's config directory (`~/.openclaw/node_modules`).
    - Corrects handling of scoped NPM packages during discovery.
- **Forced Local Installation**:
    - Patches `src/agents/skills-install.ts` and `src/plugins/install.ts` to automatically strip global flags (`-g`) and install to `~/.openclaw` if a local `package.json` exists.
    - Ensures your system package manager remains untouched by OpenClaw's internal plugin management.

## Plugins & Skills

### Local Plugins (Bun)

This package is patched to use `bun` as the primary package manager. 

**Configure Bun** as your package manager in the OpenClaw settings to install additional plugins and skills via the GUI.

For manual installations, you can initialize a local workspace:

```bash
cd ~/.openclaw
bun init -y
bun install openclaw-plugin-foo
```

> [!NOTE]
> Installed packages must have valid `openclaw` metadata in their `package.json` to be discovered. After installing or updating, restart OpenClaw to load the changes.

## Security

OpenClaw supports sandboxing to limit the agent's reach. 
The official recommendation is to use the [OpenClaw Sandbox](https://docs.openclaw.ai/gateway/sandboxing).

### Environment Health Check
OpenClaw includes a "Doctor" utility to audit your environment for potential security or configuration issues.
```bash
openclaw doctor
```

## Experimental Bubblewrap Scripts

This package provides an **experimental** wrapper using `bubblewrap` to sandbox the gateway and agent processes. This is a lightweight alternative to Docker containers for those seeking filesystem isolation.

> [!IMPORTANT]
> The bubblewrap wrapper restricts filesystem access to protect personal files and prevent unauthorized system modifications. It binds `/` as read-only, isolates `home`, and provides write access only to `~/.openclaw` and `~/.config/openclaw`.

### Usage
Replace the `openclaw` command with `openclaw-bwrap`.

```bash
openclaw-bwrap --help
```

You can pass extra bubblewrap arguments via the `OPENCLAW_BWRAP_EXTRA_ARGS` environment variable.

### Examples

**Run a command in the sandboxed environment:**
```bash
openclaw-bwrap --exec /usr/bin/bash "echo 'test' > ~/log-in-bwrapped-home.log"
```

**Use a custom bind mount:**
```bash
OPENCLAW_BWRAP_EXTRA_ARGS="--bind /mnt/data /mnt/data" openclaw-bwrap ...
```

**Run a script with the same visibility as the OpenClaw gateway:**
```bash
openclaw-bwrap --exec /home/user/.openclaw/workspace/report.py --daily
```

**Install OpenClaw as a sandboxed systemd user service:**
```bash
openclaw-bwrap-install-as-systemd-user-service --help
```

