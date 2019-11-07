Add a ssh remote

```bash
git remote add aur ssh://aur@aur.archlinux.org/keybase-git.git
```

Configure your `.ssh/config` to use the `aur` user:

```
HostName aur.archlinux.org
    IdentityFile ~/.ssh/aur_id_ed25519
    User aur
```

To update the version, run
```bash
makepkg --nobuild
```

Before committing, you must rebuild .SRCINFO:
```bash
make build
```

To push to AUR, configure SSH creds and
```bash
make push-aur
```
