# OpenClaw Arch Linux Packaging

**OpenClaw** is an experimental personal AI assistant you run on your own devices. 
It connects to channels like WhatsApp, Signal, Telegram, and Slack, and can perform tasks on your behalf.

Please refer to the [official documentation](https://docs.openclaw.ai) for configuration help.

This directory contains the `PKGBUILD` and helper scripts to package OpenClaw for Arch Linux (AUR).


> [!WARNING]
> **Security Risks**: OpenClaw is a tool that can execute code and interact with your system.
> *   **Prompt Injection**: AI models can be tricked by malicious input (e.g., from a message in a connected chat) into performing unauthorized actions.
> *   **External Exposure**: Connecting OpenClaw to public messaging channels exposes your internal agent to the outside world.

## Plugins & Skills

### Local Plugins (Bun)

This package is patched to use `bun` as package manager and for managing plugins and skills. 

**You need to configure Bun** as your package manager in the OpenClaw config to install additional plugins and skills.

In addition to the GUI-Install, you can manually add a openclaw package using:

```bash
cd ~/.openclaw
bun init -y
bun install openclaw-plugin-foo
```

*(Note: The package must have valid `openclaw` metadata in its `package.json` to be discovered)*

Restart OpenClaw. The plugin will be automatically discovered and loaded.

## Security

OpenClaw supports sandboxing to limit the agent's reach. 
The official recommendation is to use the [OpenClaw Sandbox](https://docs.openclaw.ai/gateway/sandboxing).

### Security Check
OpenClaw includes a built-in "Doctor" to check your environment for potential issues.
Run it with:
```bash
openclaw doctor
```

## Experimental Bubblewrap Scripts

This package provides an **experimental** customwrapper using `bubblewrap` to sandbox the gateway and the agent processes.

This is an **alternative** to container isolation with lesser isolation than docker but can put the gateway and the agent under the same bubblewrapped host view. It should be used with caution and fitted to your specific environment.

It only restrict filesystem access, to protect personal files from being read, and the system from being overwritten from a wild running agent.

It readonly binds `/`, makes a wrapped/isolated `home`, make a private writeable `/tmp` and mounts `~/.openclaw` and `~/.config/openclaw` writeable to the wrapped home.

You can pass extra bubblewrap arguments via environment variable:

-   `OPENCLAW_BWRAP_EXTRA_ARGS`

**Usage**: replace `openclaw` with `openclaw-bwrap`.

```bash
openclaw-bwrap --help
```

**Example**: using a custom bind mount

```bash
OPENCLAW_BWRAP_EXTRA_ARGS="--bind /mnt/data /mnt/data" openclaw-bwrap ...
```

**Example**: calling a script from openclaw in an equal environment as openclaw would see it

```bash
openclaw-bwrap --exec /home/user/.openclaw/workspace/report.py --daily
```
