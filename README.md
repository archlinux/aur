# reth-gnosis

AUR package for reth-gnosis — Gnosis Chain execution client built on Reth (Rust). Systemd service, sysusers, and tmpfiles included.

## Install from AUR

```bash
yay -S reth-gnosis
```

Or manually:

```bash
git clone https://aur.archlinux.org/reth-gnosis.git
cd reth-gnosis
makepkg -si
```

## What's included

- **Binary:** `/usr/bin/reth-gnosis` — Gnosis-compatible Reth execution client
- **Systemd service:** `reth-gnosis.service` — ready to enable
- **System user:** `reth-gnosis` (created via sysusers.d)
- **Data directory:** `/var/lib/reth-gnosis/` (created via tmpfiles.d)

## First run

1. Generate a JWT secret (shared with your consensus client):
   ```bash
   sudo openssl rand -hex 32 | sudo tee /var/lib/reth-gnosis/jwt.hex > /dev/null
   sudo chmod 644 /var/lib/reth-gnosis/jwt.hex
   ```

2. Start the service:
   ```bash
   sudo systemctl enable --now reth-gnosis
   ```

3. On first start, reth-gnosis downloads the Gnosis post-merge state (~2GB). This is a one-time operation. The subsequent state import is memory-intensive (~50GB peak RAM).

4. Pair with a Gnosis consensus client (Lighthouse, Lodestar, Teku) using the same JWT secret:
   ```bash
   lighthouse bn --network gnosis --execution-jwt /var/lib/reth-gnosis/jwt.hex ...
   ```

## Configuration

Edit the service file to customize ports, RPC settings, or other options:

```bash
sudo systemctl edit reth-gnosis
```

Default ports:
- HTTP RPC: `127.0.0.1:8545`
- Auth RPC (Engine API): `127.0.0.1:8551`
- P2P: `30303`
- Metrics: `127.0.0.1:9001`

## Issues & Support

Report issues or request features at [github.com/DanieleSalatti/reth-gnosis/issues](https://github.com/DanieleSalatti/reth-gnosis/issues)

## Upstream

- [gnosischain/reth_gnosis](https://github.com/gnosischain/reth_gnosis) — source repository
- [Gnosis Chain docs](https://docs.gnosischain.com/node/manual/execution/reth) — official Reth setup guide
- [Reth](https://github.com/paradigmxyz/reth) — upstream Rust Ethereum client

## License

MIT / Apache-2.0 (same as upstream)
