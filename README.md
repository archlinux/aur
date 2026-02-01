# OpenClaw Arch Linux Packaging

**OpenClaw** is an experimental personal AI assistant you run on your own devices. It connects to channels like WhatsApp, Signal, Telegram, and Slack, and can perform tasks on your behalf.

Please refer to the [official documentation](https://docs.openclaw.ai) for configuration help.

This directory contains the `PKGBUILD` and helper scripts to package OpenClaw for Arch Linux (AUR).

> [!WARNING]
> **Security Risks**: OpenClaw is a tool that can execute code and interact with your system.
> *   **Prompt Injection**: AI models can be tricked by malicious input (e.g., from a message in a connected chat) into performing unauthorized actions.
> *   **External Exposure**: Connecting OpenClaw to public messaging channels exposes your internal agent to the outside world.

## Plugins & Skills

### Local NPM Plugins
This package includes a patch (`enable-npm-plugins.patch`) that allows loading plugins and skills installed as standard NPM packages in your configuration directory.

```bash
cd ~/.openclaw
npm init -y
npm install openclaw-plugin-foo
```

*(Note: The package must have valid `openclaw` metadata in its `package.json` to be discovered)*

Restart OpenClaw. The plugin will be automatically discovered and loaded.

## Security

### Security Check
OpenClaw includes a built-in "Doctor" to check your environment for potential issues.
Run it with:
```bash
openclaw doctor
```

### Systemd User Service

To install OpenClaw as a systemd user service (autostart on login):

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

### Sandboxing
OpenClaw supports sandboxing to limit the agent's reach. The official recommendation is to use the **OpenClaw Sandbox** (often container-based).

### Experimental Bubblewrap Scripts
This package provides **experimental** custom scripts that use `bubblewrap` (bwrap) to sandbox the agent or the gateway processes. These are a lightweight alternative to full containers but should be used with caution and tested in your specific environment.

These wrappers restrict filesystem access, protecting your system.

You can pass extra bubblewrap arguments via environment variables:

-   `OPENCLAW_BWRAP_EXTRA_ARGS`
-   `OPENCLAW_AGENT_BWRAP_EXTRA_ARGS`
-   `OPENCLAW_CONTAINER_AGENT_BWRAP_EXTRA_ARGS`

Example: using a custom bind mount

```bash
OPENCLAW_BWRAP_EXTRA_ARGS="--bind /mnt/data /mnt/data" openclaw-bwrap ...
```

#### `openclaw-bwrap`

Wrapper for the main `openclaw` binary.

-   **Restrictions**: Read-only access to system directories (`/usr`, `/lib`, etc.). Writable access only to `/tmp` and `~/.openclaw`.
-   **Usage**: replace `openclaw` with `openclaw-bwrap`.

```bash
openclaw-bwrap --help
```

#### `openclaw-agent-bwrap`

Wrapper specifically for running agents.

-   **Defaults**: Same as `openclaw-bwrap` but with intended specific defaults for agent isolation.
-   **Usage**:

```bash
openclaw-agent-bwrap [agent-args]
```

#### `openclaw-container-agent-bwrap`

Wrapper for agents that require container access (e.g., Docker Agent Executor).

-   **Runtime Detection**: Automatically detects **Podman** (default) or **Docker**.
-   **Override**: Set `OPENCLAW_CONTAINER_RUNTIME=docker` to force Docker use.
-   **Access**: Mounts the appropriate socket (`/run/user/$UID/podman/podman.sock` or `/var/run/docker.sock`).
-   **Usage**:

```bash
openclaw-container-agent-bwrap [agent-args]
```


