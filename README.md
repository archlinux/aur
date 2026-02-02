# OpenClaw Arch Linux Packaging

**OpenClaw** is an experimental personal AI assistant you run on your own devices. It connects to channels like WhatsApp, Signal, Telegram, and Slack, and can perform tasks on your behalf.

Please refer to the [official documentation](https://docs.openclaw.ai) for configuration help.

This directory contains the `PKGBUILD` and helper scripts to package OpenClaw for Arch Linux (AUR).


> [!WARNING]
> **Security Risks**: OpenClaw is a tool that can execute code and interact with your system.
> *   **Prompt Injection**: AI models can be tricked by malicious input (e.g., from a message in a connected chat) into performing unauthorized actions.
> *   **External Exposure**: Connecting OpenClaw to public messaging channels exposes your internal agent to the outside world.

## Plugins & Skills

### Local Plugins (Bun)
This package is patched to support `bun` for managing plugins and skills. **You MUST configure Bun** as your package manager in the OpenClaw config.

```bash
cd ~/.openclaw
bun init -y
bun install openclaw-plugin-foo
```

*(Note: The package must have valid `openclaw` metadata in its `package.json` to be discovered)*

Restart OpenClaw. The plugin will be automatically discovered and loaded.

## Security

OpenClaw supports sandboxing to limit the agent's reach. The official recommendation is to use the **OpenClaw Sandbox** (often container-based).

### Security Check
OpenClaw includes a built-in "Doctor" to check your environment for potential issues.
Run it with:
```bash
openclaw doctor
```

### Systemd User Service


If using OpenClaw without additional bubblewrap, openclaw can install itself as systemd user service.

To install OpenClaw BubbleWrapped as a systemd user service (autostart on login):

```bash
# Install default profile
openclaw-install-systemd-user-service

# Install specific profile
openclaw-install-systemd-user-service --profile my-profile

# Remove service
openclaw-install-systemd-user-service --remove
```

Start/Stop the service:
```bash
systemctl --user start openclaw-default
systemctl --user stop openclaw-default
```

### Experimental Bubblewrap Scripts

This package provides an **experimental** custom scripts that use `bubblewrap` (bwrap) to sandbox the gateway or the agent processes. These are an alternative to container isolation but should be used with caution and fitted to your specific environment.

These wrappers restrict filesystem access, to protect personal files from being read, and the system from being overwritten.

It readonly binds `/`, makes a wrapped/isolated `home`, make a private writeable `/tmp` and mounts `~/.openclaw` and `~/.config/openclaw` writeable to the wrapped home.

You can pass extra bubblewrap arguments via environment variables:

-   `OPENCLAW_BWRAP_EXTRA_ARGS`
-   `OPENCLAW_AGENT_BWRAP_EXTRA_ARGS`

Example: using a custom bind mount

```bash
OPENCLAW_BWRAP_EXTRA_ARGS="--bind /mnt/data /mnt/data" openclaw-bwrap ...
```

**Usage**: replace `openclaw` with `openclaw-bwrap`.

```bash
openclaw-bwrap --help
```


**Usage**: replace `openclaw agent` with `openclaw-agent-bwrap`.

```bash
openclaw-agent-bwrap [agent-args]
```

