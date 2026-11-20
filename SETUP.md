# Run Convex locally

**Trusted single-user hosts only.** Upstream passes the instance secret in process arguments. Local users may be able to read it, including through systemd, and gain full Convex admin access. Loopback binding does not protect against this. Do not use this setup on a shared host.

Create the instance secret once and keep it with your database backups. The command refuses to overwrite an existing secret:

```bash
sudo bash -ec 'install -d -m700 /etc/convex; set -o noclobber; umask 077; openssl rand -hex 32 > /etc/convex/instance-secret'
sudo systemctl edit convex-backend.service
```

Add this drop-in to opt in to the upstream credential handling:

```ini
[Service]
Environment=CONVEX_ALLOW_SECRET_IN_ARGV=yes
```

```bash
sudo systemctl enable --now convex.target
sudo env CONVEX_ALLOW_SECRET_IN_ARGV=yes /usr/lib/convex/convex-backend keygen
```

Open `http://127.0.0.1:6791` and enter `http://127.0.0.1:3210` and the generated admin key. HTTP Actions listen on port 3211. All three ports bind to loopback. The backend stores SQLite and uploaded files under `/var/lib/convex`.
