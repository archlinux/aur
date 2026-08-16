# caddy-trojan

[![Check upstream and update PKGBUILD](https://github.com/tsaitang404/caddy-trojan/actions/workflows/update.yml/badge.svg)](https://github.com/tsaitang404/caddy-trojan/actions/workflows/update.yml)

AUR package: Caddy web server with [imgk/caddy-trojan](https://github.com/imgk/caddy-trojan) plugin.

## Install

```bash
paru -S caddy-trojan
```

## Usage

1. Start the service: `sudo systemctl enable --now caddy-trojan`
2. Edit config: `/etc/caddy/Caddyfile`
3. See [Caddy docs](https://caddyserver.com/docs/) for configuration.

### Trojan client config

```
Address: your-server.com
Port: 443
Password: (set in Caddyfile global trojan block)
```

## Custom build

This package uses `xcaddy` to build Caddy with the `imgk/caddy-trojan` plugin.

The systemd service runs as `root` (required by the trojan listener wrapper).
