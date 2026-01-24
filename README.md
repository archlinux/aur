# Stegasoo API AUR Package

REST API server package for programmatic steganography operations. Includes HTTPS support and API key authentication.

## Installation

### From AUR (once published)
```bash
yay -S stegasoo-api-git
# or
paru -S stegasoo-api-git
```

### Manual build
```bash
git clone https://aur.archlinux.org/stegasoo-api-git.git
cd stegasoo-api-git
makepkg -si
```

## What Gets Installed

- `/opt/stegasoo-api/venv/` - Self-contained Python venv with API dependencies
- `/opt/stegasoo-api/config/` - API key storage
- `/opt/stegasoo-api/certs/` - TLS certificates
- `/usr/bin/stegasoo` - CLI executable
- `/usr/lib/systemd/system/stegasoo-api.service` - Systemd service

## Quick Start

```bash
# 1. Create an API key
sudo -u stegasoo stegasoo api keys create mykey

# 2. Start the service
sudo systemctl enable --now stegasoo-api

# 3. Test the API
curl -k -H "X-API-Key: YOUR_KEY" https://localhost:8000/
```

## Service Details

| Setting | Value |
|---------|-------|
| Port | 8000 |
| Protocol | HTTPS (self-signed cert auto-generated) |
| API Docs | https://localhost:8000/docs |
| OpenAPI | https://localhost:8000/openapi.json |

## API Key Management

```bash
# List all keys
stegasoo api keys list

# Create a new key
sudo -u stegasoo stegasoo api keys create <name>

# Revoke a key
sudo -u stegasoo stegasoo api keys revoke <name>
```

## TLS Configuration

```bash
# View current certificate info
stegasoo api tls info

# Generate new self-signed certificate
sudo -u stegasoo stegasoo api tls generate

# Use custom certificates (edit service)
sudo systemctl edit stegasoo-api
# Add:
# [Service]
# ExecStart=
# ExecStart=/opt/stegasoo-api/venv/bin/stegasoo api serve \
#     --host 0.0.0.0 --port 8000 \
#     --cert /path/to/cert.pem --key /path/to/key.pem
```

## Manual Run (without systemd)

```bash
# Development mode (auto-reload)
/opt/stegasoo-api/venv/bin/stegasoo api serve --reload

# Production mode
/opt/stegasoo-api/venv/bin/stegasoo api serve --host 0.0.0.0 --port 8000
```

## For Web UI

Install the full package instead:
```bash
yay -S stegasoo-git
```

## Maintainer

Aaron D. Lee
