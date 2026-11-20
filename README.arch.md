# stoat-for-web (Arch / AUR)

This builds the upstream *v0.17.0* web frontend from the pinned official release and two public Git submodules. The private brand/assets submodule is intentionally not fetched; upstream falls back to its bundled assets. The output is **static web files**; no separate Node server or web-client systemd unit is needed.

## Install and configure

1. Build and install with `makepkg -si`. The package-managed, unconfigured assets live under `/usr/share/webapps/stoat-web/dist/`; configured, Nginx-ready assets are generated under `/usr/share/webapps/stoat-web/releases/`. Nginx must use `/usr/share/webapps/stoat-web/current/` (not `dist/`).
2. Edit `/etc/stoat-web/config`, filling `VITE_HOST` (instance host, no scheme) and `VITE_API_URL` (public https URL), for example:

   ```ini
   VITE_HOST=chat.example.org
   VITE_API_URL=https://api.chat.example.org
   ```

   Set `VITE_DEV_WS_URL`, `VITE_DEV_MEDIA_URL`, `VITE_DEV_PROXY_URL`, and `VITE_DEV_GIFBOX_URL` only if you need explicit overrides. They must be **public browser URLs**, not 127.0.0.1 service ports on your server. The backend's `/` discovery endpoint normally supplies event/media/proxy URLs.
3. Run `sudo stoat-for-web-render`. This writes a freshly configured, browser-ready deployment under `/usr/share/webapps/stoat-web/releases/` and switches the symlink `/usr/share/webapps/stoat-web/current` atomically.
4. Point Nginx `root` to `/usr/share/webapps/stoat-web/current` and set `try_files $uri $uri/ /index.html` to support SPA routes. An example is in `/usr/share/doc/stoat-for-web/nginx.conf`.
5. Reload Nginx after verifying the host's TLS and reverse-proxy configuration. A page loaded over HTTPS must use HTTPS/WSS public endpoints.

Run `sudo stoat-for-web-render` after changing `/etc/stoat-web/config`. The installed pacman hook renders automatically on future package installs/upgrades **only when both required fields are configured**, while keeping the local config preserved via `backup`.

The renderer atomically switches deployments and then prunes outdated releases; browsers may retain old PWA resources until their service worker refreshes. Consider refreshing the PWA or clearing site data after a major configuration change.

## Build details

- Source release: https://github.com/stoatchat/for-web/releases/tag/stoat-for-web-v0.17.0
- Build toolchain: `corepack pnpm` (uses upstream's pinned pnpm 11.3.0) and Node.js 24+.
- pnpm downloads JavaScript dependencies during `prepare()`, respecting the repository's frozen lockfile. An internet connection is required for first build.
- Source commits and submodule gitlinks are pinned. The Git sources use `SKIP` checksums (normal for git VCS sources); local package auxiliary files have SHA-256 checksums.
- The static build is architecture independent, so `arch=('any')`.

## What this package does not do

- It doesn't change any of your `stoat-server` systemd units or provide backend services.
- It doesn't configure TLS certificates or backend proxy routes.
- It doesn't embed a specific instance domain into a publicly distributed AUR package.
- The full upstream pnpm/Vite build has **not** been run in this environment. Verify `makepkg -si` on Arch before publishing to AUR.

## Migration from 0.17.0-1 package layout

Previously, files were stored under `/usr/share/webapps/stoat-for-web/`, the
rendered document root was `/var/lib/stoat-for-web/current`, and the config was
`/etc/stoat-for-web.conf`. Save your existing settings *outside the new target
path* before upgrading (otherwise pacman may report a file conflict):

```bash
sudo cp -a /etc/stoat-for-web.conf /root/stoat-for-web.conf.backup
```

Upgrade the AUR package to `0.17.0-2` and then copy your settings into the new
pacman-managed config path:

```bash
sudo install -Dm644 /root/stoat-for-web.conf.backup /etc/stoat-web/config
sudo stoat-for-web-render
```

Change Nginx `root` to `/usr/share/webapps/stoat-web/current;`. Verify
`current/index.html` exists before reloading Nginx. Do not remove the old
`/var/lib/stoat-for-web` deployment until the new site is working.
