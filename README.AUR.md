# tsidp-git

This package provides the Tailscale OIDC Identity Provider (tsidp) component from Tailscale.

## Description

Tsidp is a standalone component that allows you to create an OIDC Identity Provider using your Tailscale network, which can be used for authentication with various OIDC-compatible services.

## Installation

```bash
yay -S tsidp-git
```

## Configuration

After installation:

1. Make sure tailscale is installed and running
2. Start the service:
   ```bash
   sudo systemctl enable --now tsidp
   ```

## Usage

The service will run on port 443 by default. Use the following arguments to customize:

- `--dir` - Directory for storing data (default: /var/lib/tailscale/tsidp)
- `--port` - Port to listen on (default: 443)
- `--use-local-tailscaled` - Connect to the local tailscaled instance (default: true)

You can modify these settings by editing the systemd service file at `/usr/lib/systemd/system/tsidp.service`.