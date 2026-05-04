# OpenClaw Arch Linux Packaging

**OpenClaw** is an experimental personal AI assistant you run on your own devices. 
It connects to channels like WhatsApp, Signal, Telegram, and Slack, and can perform tasks on your behalf.

Refer to the [official documentation](https://docs.openclaw.ai) for comprehensive configuration guides.

This repository contains the `PKGBUILD` and helper scripts for the Arch Linux package.

This package is patched to use `bun` as the primary package manager. **Configure Bun** as your package manager in the OpenClaw settings to install additional plugins and skills via the GUI.

> [!WARNING]
> **Security Risks**: OpenClaw executes code and interacts with your system.
> *   **Prompt Injection**: AI models can be tricked by malicious input (e.g., from a message in a connected chat) into performing unauthorized actions.
> *   **External Exposure**: Connecting OpenClaw to public messaging channels exposes your internal agent to the outside world.

## OpenClaw Patching

To adopt openclaw to archlinux, we need to patch the upstream source. Because the upstream source changes rapidly, the `openclaw-git` package uses a shell script (`openclaw-patch.sh`) to regenerate the patch file on request, but with manual review and approval.

### Key Modifications:
- **Runtime Transition**: Replaces `pnpm` with `bun run` across the `package.json` and internal script runners (e.g. `scripts/bundle-a2ui.sh`).
- **Dependency & Build Fixes**: 
    - Adds `node-gyp` to `devDependencies` to ensure native modules like `sharp` build correctly from source.
    - Removes the optional `@discordjs/opus` dependency to prevent `node-gyp` build failures natively on Node 25, alongside an `any` typecast in `src/discord/voice/manager.ts` to bypass subsequent TypeScript errors.
- **Improved UI Runner**: Updates `scripts/ui.js` to prioritize `bun` for managing the Control UI.
- **User-Centric Plugin Discovery**:
    - Appends a new `discoverNpmPlugins` function to `src/plugins/discovery.ts` to discover NPM-style plugins installed locally in the user's config directory (`~/.openclaw/node_modules`), handling scoped packages correctly.
- **Forced Local Installation**:
    - Modifies `src/agents/skills-install.ts` and `src/plugins/install.ts` to automatically strip global flags (`-g`) and install plugins directly to `~/.openclaw` if a local `package.json` exists, keeping your system package manager untouched by OpenClaw.

### Local Plugins (Bun)

For manual installations, you can also install plugins in `~/.openclaw` by initializing a local workspace:

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

