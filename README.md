# Auggie CLI (AUR Package)

AI-powered agentic CLI for code augmentation with context-aware agents by Augment Code.

## About

Auggie CLI is a command-line interface tool that brings Augment's agent and context engine to your terminal. It enables developers to run context-aware agents for code analysis, generation, review, and automation anywhere in their development workflow.

- **Website**: https://augmentcode.com
- **Product Page**: https://www.augmentcode.com/product/CLI
- **Documentation**: https://docs.augmentcode.com/cli/overview
- **GitHub Repository**: https://github.com/augmentcode/auggie

## Installation

### Using an AUR Helper

```bash
# Using yay
yay -S auggie-bin

# Using paru
paru -S auggie-bin
```

### Manual Installation

```bash
git clone https://aur.archlinux.org/auggie-bin.git
cd auggie-bin
makepkg -si
```

## Requirements

- **Node.js**: Version 20 or later (`nodejs>=20`)
- **Shell**: zsh, bash, fish, or compatible
- **Augment Account**: Active subscription required

## Quick Start

### 1. Authenticate

Before using Auggie, you need to log in to your Augment account:

```bash
auggie login
```

### 2. Verify Installation

```bash
auggie --version
```

### 3. Start Using Auggie

Navigate to your project directory and run:

```bash
cd /path/to/your/project
auggie
```

## Usage Modes

### Interactive Mode

Run `auggie` to start an interactive terminal session with real-time streaming, visual progress, and tool call tracking:

```bash
auggie
auggie "Give me a summary of this project"
```

### Print Mode (Automation/Headless)

Use `--print` for single-shot execution with output to stdout. Perfect for CI/CD pipelines and scripts:

```bash
auggie --print "Summarize the staged changes"
auggie --print --quiet "Check for build errors"
```

### Pipe Support

Auggie works as a Unix-style utility with stdin/stdout pipe support:

```bash
git diff | auggie --print "Explain the impact of these changes"
cat build.log | auggie --print --quiet "Analyze this build failure"
```

### MCP Server Mode

Run Auggie as an MCP (Model Context Protocol) server for integration with external AI tools:

```bash
auggie --mcp
```

### Custom Commands

Execute custom commands from `.augment/commands/` or `~/.augment/commands/`:

```bash
auggie command deploy-staging
```

## Environment Variables

| Variable | Description |
|----------|-------------|
| `AUGMENT_SESSION_AUTH` | Authentication JSON for non-interactive sessions |
| `GITHUB_API_TOKEN` | GitHub API token for GitHub integration |
| `AUGMENT_DISABLE_AUTO_UPDATE` | Set to `1` to disable automatic CLI updates |

### Disabling Auto-Updates

Auggie CLI automatically updates itself by default. To disable this behavior:

```bash
export AUGMENT_DISABLE_AUTO_UPDATE=1
```

Add this to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.) to make it persistent.

## Authentication

### Login

```bash
auggie login
```

### View Session Token

```bash
auggie token print
```

### Using Session Auth in Automation

```bash
AUGMENT_SESSION_AUTH='$(auggie token print)' auggie --print "Summarize the build failure"
```

### Logout

```bash
auggie logout
```

## Key Features

- **Context Engine**: Semantic codebase understanding (not just grep)
- **Sub Agents**: Delegate specialized tasks to focused agents
- **Resumable Sessions**: Pick up where you left off across terminal sessions
- **Prompt Enhancer**: Transform rough instructions into optimized prompts
- **User & Repo Rules**: Define persistent guardrails for your workflow
- **Parallel Agents**: Run multiple agents simultaneously
- **Headless Mode**: Integrate with GitHub Actions, Jenkins, or any CI/CD
- **Session Sharing**: Export conversations as Markdown for documentation
- **Streaming Output**: Real-time agent activity visibility
- **MCP Support**: Connect to GitHub, Linear, Jira, and other MCP-compatible tools
- **Multi-model Support**: Choose your model (Claude, GPT-4, or bring your own)
- **Task Manager**: Break complex work into steps and track progress
- **Custom Commands**: Build specialized agents for any workflow
- **Tool Permissions**: Control agent capabilities per environment

## Licensing

### Important: Subscription Required

**Auggie CLI is proprietary software** distributed under a custom proprietary license by Augment Computing, Inc.

- **An active Augment subscription is required** to use Auggie CLI
- If your subscription ends, your right to use the CLI automatically terminates
- Redistribution of the CLI is prohibited without prior written permission
- The CLI must not be reverse-engineered, decompiled, or modified
- Commercial use requires a separate licensing agreement

See the installed license file at `/usr/share/licenses/auggie-bin/LICENSE.md` for full terms.

For licensing inquiries, contact: support@augmentcode.com

## Beta Status

Auggie CLI is currently in **beta** and may not run on all environments and terminal configurations. Some features may change without notice.

### Known Limitations

- Requires a terminal that supports ANSI escape codes for interactive mode
- Recommended terminals: Ghostty, iTerm2, Windows Terminal, Alacritty, Kitty
- When connecting over SSH or through tmux, you may need to adjust terminal settings

## Troubleshooting

### Command Not Found

Ensure Node.js 20+ is installed and in your PATH:

```bash
node --version
```

### Authentication Errors

Run `auggie login` to authenticate with your Augment account.

### Auto-Update Issues

If auto-updates cause issues, disable them:

```bash
export AUGMENT_DISABLE_AUTO_UPDATE=1
```

Then manually update:

```bash
auggie upgrade
```

### Permission Denied

Ensure the binary has execute permissions:

```bash
chmod +x /usr/lib/node_modules/@augmentcode/auggie/augment.mjs
```

## Upgrading

```bash
# Using AUR helper
yay -Syu auggie-bin
# or
paru -Syu auggie-bin

# Or rebuild from AUR
cd /path/to/auggie-bin
git pull
makepkg -si
```

## Package Information

- **Package Name**: auggie-bin
- **Version**: 0.24.0
- **Architecture**: any
- **License**: Custom Proprietary
- **Dependencies**: nodejs>=20
- **Build Dependencies**: npm

## Resources

- [Auggie CLI Documentation](https://docs.augmentcode.com/cli/overview)
- [Install Guide](https://docs.augmentcode.com/cli/setup-auggie/install-auggie-cli)
- [CLI Flags and Options](https://docs.augmentcode.com/cli/reference)
- [Automation Guide](https://docs.augmentcode.com/cli/automation/overview)
- [GitHub Repository](https://github.com/augmentcode/auggie)
- [Report Issues](https://github.com/augmentcode/auggie/issues)
