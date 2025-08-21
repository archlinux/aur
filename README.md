# ClaraVerse - AUR Package

## What is ClaraVerse?

ClaraVerse is a privacy-first, client-side AI assistant WebUI that brings together the best open-source AI tools in one beautiful interface. It's designed to be completely local and private, giving you full control over your AI interactions.

## Features

- **Clara Core**: Chat with local LLMs powered by Ollama
- **ComfyUI Integration**: Generate images with advanced AI models
- **Custom AI Agents**: Build and deploy your own AI workflows
- **n8n Workflows**: Integrate with n8n for advanced automation and workflow orchestration
- **Beautiful Interface**: Modern, responsive design that works on all devices
- **100% Private**: No data leaves your machine, no subscriptions required
- **Docker Support**: Easy setup for ComfyUI and other services

## Installation

### From AUR

```bash
# Using paru
paru -S clara-verse

# Using yay
yay -S clara-verse

# Using pacman + git
git clone https://aur.archlinux.org/clara-verse.git
cd clara-verse
makepkg -si
```

### Manual Build

```bash
# Clone the repository
git clone https://aur.archlinux.org/clara-verse.git
cd clara-verse

# Build the package
makepkg -sr

# Install the package
sudo pacman -U clara-verse-*.pkg.tar.zst
```

## Prerequisites

- **Node.js** (>= 18.0.0) - For building the application
- **Docker** - For ComfyUI integration
- **Python** - For backend services
- **Electron** - Runtime environment (installed automatically)

### Optional Dependencies

- **Ollama** - For local LLM support
  ```bash
  paru -S ollama
  ```

## Usage

### Launching ClaraVerse

1. **From Applications Menu**: Search for "ClaraVerse" in your desktop environment
2. **From Terminal**: Run `clara-verse`
3. **From Desktop**: Double-click the ClaraVerse icon

### First-Time Setup

1. **Launch the application**
2. **Wait for initial setup** - ClaraVerse will download necessary components
3. **Configure Docker** - Ensure Docker is running for ComfyUI features
4. **Download Models** - Choose and download your preferred AI models

### Key Features

- **Chat Interface**: Interact with local LLMs through a clean chat UI
- **Image Generation**: Create images using ComfyUI workflows
- **Agent Studio**: Build custom AI agents for automation
- **n8n Integration**: Connect with n8n workflows for advanced automation, API integrations, and complex workflow orchestration
- **Model Management**: Download and manage different AI models
- **Privacy Controls**: All data stays on your machine

## Configuration

### Docker Setup (Required for ComfyUI)

```bash
# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to docker group (optional, for non-root access)
sudo usermod -aG docker $USER
```

### Ollama Setup (Optional, for local LLMs)

```bash
# Install Ollama
paru -S ollama

# Start Ollama service
ollama serve

# Download a model (example)
ollama pull llama2:7b
```

### n8n Workflow Integration

ClaraVerse includes built-in support for n8n workflows, allowing you to:
- Connect to existing n8n instances
- Trigger workflows from within ClaraVerse
- Pass data between ClaraVerse and n8n workflows
- Create complex automation chains

To set up n8n integration:
1. Ensure you have n8n running (locally or remotely)
2. Configure the connection in ClaraVerse settings
3. Import or create your workflows in n8n
4. Connect them to ClaraVerse for seamless automation

## Troubleshooting

### Common Issues

1. **"Docker not running" error**
   ```bash
   sudo systemctl start docker
   ```

2. **Permission denied errors**
   ```bash
   sudo chown -R $USER:$USER ~/.config/ClaraVerse
   ```

3. **Models not downloading**
   - Check your internet connection
   - Ensure you have sufficient disk space
   - Try restarting the application

4. **ComfyUI not working**
   - Verify Docker is running: `docker ps`
   - Check Docker logs: `docker logs clara_comfyui`

5. **n8n integration issues**
   - Verify n8n is accessible from your network
   - Check firewall settings
   - Ensure proper authentication credentials

### Getting Help

- **GitHub Issues**: [ClaraVerse Issues](https://github.com/badboysm890/ClaraVerse/issues)
- **Discord Community**: [Join our Discord](https://discord.gg/j633fsrAne)
- **Documentation**: [ClaraVerse Docs](https://claraverse.space/)

## Development

### Building from Source

```bash
# Clone the repository
git clone https://github.com/badboysm890/ClaraVerse.git
cd ClaraVerse

# Install dependencies
npm install

# Build the application
npm run build

# Build Electron app
npm run electron:build-linux
```

### Contributing

1. **Fork the repository** on GitHub
2. **Create a feature branch**: `git checkout -b feature-name`
3. **Make your changes** and commit them
4. **Push to your fork** and create a pull request


## Package Information

- **Package Name**: `clara-verse`
- **Version**: 0.1.3
- **Architecture**: x86_64
- **License**: MIT
- **Maintainer**: wintrx1155
- **Upstream**: [badboysm890/ClaraVerse](https://github.com/badboysm890/ClaraVerse)

## Links

- **Homepage**: https://claraverse.space/
- **GitHub**: https://github.com/badboysm890/ClaraVerse
- **Discord**: https://discord.gg/j633fsrAne
- **Documentation**: https://claraverse.space/docs
- **Releases**: https://github.com/badboysm890/ClaraVerse/releases

## License

This AUR package is licensed under the MIT License, same as the upstream project.

---
