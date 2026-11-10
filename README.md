# colibri-git for Arch Linux / Snug Linux

[Українська документація](README-uk.md) · [Original upstream README](README.upstream.md)

This package builds the Colibri inference engine from its Git `main` branch for CPU-only Linux hosts and installs a reusable systemd template for independent model instances.

## Package layout

| Path | Purpose |
| --- | --- |
| `/usr/bin/coli` | Symlink to `../lib/colibri/coli` |
| `/usr/lib/colibri/coli` | Actual Python launcher |
| `/usr/lib/colibri/qwen36` and other binaries | Compiled inference engines |
| `/usr/lib/colibri/colibri-instance` | Instance launcher used by systemd |
| `/usr/lib/systemd/system/colibri@.service` | Generic systemd template |
| `/usr/share/colibri-git/*.conf.example` | Configuration examples |
| `/etc/colibri/` | Empty directory created by the package; per-model settings are created manually |

The launcher must stay alongside its internal components: upstream resolves its own location using `os.path.realpath(__file__)`.

## Build the package

On the build host, as a regular user (not root):

```bash
sudo pacman -S --needed base-devel git python nodejs npm
mkdir -p ~/builds/colibri-git
cd ~/builds/colibri-git
# Put the PKGBUILD and its local source files into this directory.
makepkg -s --cleanbuild --log
```

`makepkg` only creates a package. Review it before installing:

```bash
pacman -Qlp ./colibri-git-*.pkg.tar.zst | grep -E 'colibri@\.service|colibri-instance|\.conf\.example|README'
```

The package conflicts with `colibri-bin`. Stop any active Colibri processes and back up your local configuration before installing the new package explicitly with `pacman -U`. Model files in `/var/lib/llama/models/colibri` and existing Colibri state in `/root/.local/share/colibri` are not packaged.

## Run Qwen3-Coder-30B on port 8091

On `llm-node01`, as root, after installing the built package:

```bash
install -m 600 /usr/share/colibri-git/qwen3-coder-30b.conf.example \
  /etc/colibri/qwen3-coder-30b.conf
```

Review `/etc/colibri/qwen3-coder-30b.conf`, especially `COLI_MODEL`, `COLI_PORT`, `COLI_CPU_AFFINITY`, and the OpenMP settings. Before enabling the service, stop any manually started process on the same port. `coli stop` stops the instance registered by the current `coli setup`; verify which instance it targets first.

```bash
ss -ltnp | grep ':8091' || true
systemctl daemon-reload
systemctl enable --now colibri@qwen3-coder-30b.service
systemctl status colibri@qwen3-coder-30b.service --no-pager
curl -fsS http://127.0.0.1:8091/health
```

## Additional model instances

A second example, `qwen36.conf.example`, targets port `8090`, but its model directory is a **placeholder**. Verify and replace `COLI_MODEL` before enabling it:

```bash
install -m 600 /usr/share/colibri-git/qwen36.conf.example /etc/colibri/qwen36.conf
# Edit /etc/colibri/qwen36.conf to use the real local model directory.
systemctl enable --now colibri@qwen36.service
```

Each instance uses `/etc/colibri/<instance>.conf` and can be managed independently:

```bash
systemctl start colibri@qwen3-coder-30b.service
systemctl stop colibri@qwen3-coder-30b.service
systemctl restart colibri@qwen3-coder-30b.service
journalctl -u colibri@qwen3-coder-30b.service -f
```

The generic service does **not** prevent concurrent models from exhausting RAM. It does not automatically enable or start any model instance at package installation time. The current unit runs as `root` for compatibility with the existing manual installation.

## Existing hand-written units

A previously created `/etc/systemd/system/colibri@.service` takes precedence over the packaged `/usr/lib/systemd/system/colibri@.service`. Use `systemctl cat colibri@qwen3-coder-30b.service` to inspect which unit is active. Back up any existing local unit before replacing or removing it.

## Notes and limitations

- The source follows a moving Git `main` branch; record a commit for reproducible builds.
- CPU compilation is configured for `ARCH=x86-64-v3` (suitable for AMD Ryzen 9 7950X).
- This source package has not been compiled or installed on your server as part of these documentation changes.
- `--auto-tier` controls the model's RAM/VRAM tiering; service startup and prefill can still take time.
- A systemd service does not resolve long-context prefill performance or oversized Open WebUI prompts.
