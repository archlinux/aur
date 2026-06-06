# Pushing to AUR — one-time steps

The package is built, tested, and committed locally. To push to the AUR
(where your existing broken stub lives), you need to do **one** of:

## Option A: register this host's SSH key on your AUR account

1. Log in to https://aur.archlinux.org/account/petrouil/edit
2. Paste this public key into the "SSH Public Key" field.
   **The exact text — including the trailing `petrouil@archimidis` comment —
   must match byte-for-byte. A single typo in the base64 will silently
   register a DIFFERENT key. To be safe, run this from a terminal:**
   ```bash
   xclip -selection clipboard < ~/.ssh/id_rsa.pub   # or use xdotool, pbcopy, etc.
   ```
   …then paste into the form. The key is:
   ```
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRp79O8+QzXOtqz1ZCH2sWd57jrAh1w2TlOd+4qVRXM479P8qCmXfYouk1WTthE41xGn3t9/tEG7VPakLpGS3jcj0NXgzO03w1hfJIXK0u5WfDRlsbnTtaEebRdpLQvSfHZMH4sKObfErnm+8Pr4G2Skc6uqbWKvBRU8rqmNkKEXHa5W+pnUMcFq0Oh1Y/dTPB3fGvbiBE4UpItBqQOV3N6Zd/2Vl4+THV75BGK+RCRKN6F476PArByNOpQYV9t8ztiWVfiRPeSlXO2MZ+VhdF7ZOtHPOC1CRaqJB8Ue+q2qlvt65SUYfoCe3UAA2ar+w9B/jMCbY0UStotaNKBngenP350mNWFb7Hi0lXMncPluxOxePXb3R8U7b67B761FTwqrIRYcTqUBOWkLn6meClW58AmfluFg828r7092M3cyD7YcNyjxtRbiQvjfVfmvQ7sS/CPGzW1J2Ce8PXdUmuPMNcTpZmZa7qbXnptNQNiRi99PmdMsD22+dLWarw+W8= petrouil@archimidis
   ```
   SHA256 fingerprint: `lNZ5Z0fydn2UWepomy8WuGTCamcuaAh54BnNr31Hbls`
3. Click "Save" (or "Update")
4. Then run the push:
   ```bash
   cd /home/petrouil/tmp3/odysseus-ai-git
   git push -u origin master
   ```

**Verify the upload worked** before pushing:
```bash
ssh-keyscan -t ed25519 aur.archlinux.org >/dev/null 2>&1   # prime known_hosts
ssh -T -o IdentitiesOnly=yes -i ~/.ssh/id_rsa aur@aur.archlinux.org
# Expected: "petrouil" or similar welcome if the key matches.
# If you get "Permission denied (publickey)" the AUR-side key is
# different — re-paste, very carefully, or use Option B below.
```
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRp79O8+QzXOtqz1ZCH2sWd57jrAh1w2TlOd+4qVRXM479P8qCmXfYouk1WTthE41xGn3t9/tEG7VPakLpGS3jcj0NXgzO03w1hfJIXK0u5WfDRlsbnTtaEebRdpLQvSfHZMH4sKObfErnm+8Pr4G2Skc6uqbWKvBRU8rqmNkKEXHa5W+pnUMcFq0Oh1Y/dTPB3fGvbiBE4UpItBqQOV3N6Zd/2Vl4+THV75BGK+RCRKN6F476PArByNOpQYV9t8ztiWVfiRPeSlXO2MZ+VhdF7ZOtHPOC1CRaqJB8Ue+q2qlvt65SUYfoCe3UAA2ar+w9B/jMCbY0UStotaNKBngenP350mNWFb7Hi0lXMncPluxOxePXb3R8U7b67B761FTwqrIRYcTqUBOWkLn6meClW58AmfluFg828r7092M3cyD7YcNyjxtRbiQvjfVfmvQ7sS/CPGzW1J2Ce8PXdUmuPMNcTpZmZa7qbXnptNQNiRi99PmdMsD22+dLWarw+W8= petrouil@archimidis
   ```
3. Click "Save" (or "Update")
4. Then run the push:
   ```bash
   cd /home/petrouil/tmp3/odysseus-ai-git
   git push -u origin master
   ```

## Option B: use a different SSH key

If you have a different key registered on the AUR, set it up for this host:
```bash
cat ~/.ssh/aur_key.pub > ~/.ssh/aur_key
chmod 600 ~/.ssh/aur_key
echo "Host aur.archlinux.org
  IdentityFile ~/.ssh/aur_key
  IdentitiesOnly yes" > ~/.ssh/config
chmod 600 ~/.ssh/config
cd /home/petrouil/tmp3/odysseus-ai-git
git push -u origin master
```

## What the push does

- Replaces the broken stub (`pkgver = 1.0.0-1`, "DOES NOT WORK") with the
  real working build (`pkgver = r856.73673258-1`)
- Uploads 21 tracked files (PKGBUILD, .SRCINFO, install hook, systemd
  unit, env file, two patches, lock files, scripts, README, CHANGELOG,
  LICENSE, icon, .gitignore)
- The prebuilt package (.pkg.tar.zst) is NOT in the tracked files; AUR
  maintainers build from source, so users get fresh builds.

## After the push

1. Wait ~5 minutes for the AUR web interface to refresh.
2. Verify: `https://aur.archlinux.org/packages/odysseus-ai-git/`
   should show the new version, working description, MIT license, your
   maintainer name.
3. AUR voters may flag issues — most common will be "uv is not a
   makedepend" or "node_modules in package is huge". The README and
   PKGBUILD header already address these. Be ready to defend the
   prebuilt-venv design (it's the only viable option since upstream
   `pyproject.toml` has no `[build-system]`).
4. Eventually, upstream the path patches to
   https://github.com/pewdiepie-archdaemon/odysseus so the AUR package
   doesn't need them. The list of files I patched is in the PKGBUILD
   `prepare()` function.

## If the push fails with non-permission errors

- "repository already exists" → AUR shows you own it; just `git push`
  (no `clone` needed).
- "non-fast-forward" → the AUR master is ahead. Re-run `git pull --rebase
  origin master` first.
- "src/odysseus is not a tracked file" but makepkg complains → run
  `git status` and ensure only the expected files are modified.

## To update later (new upstream commit)

```bash
cd /home/petrouil/tmp3/odysseus-ai-git
# 1. Bump pkgver() in PKGBUILD if upstream is still on main; otherwise
#    just re-run makepkg and it'll pick up the new commit count
# 2. Re-run makepkg to verify build still works
makepkg -sf --nocheck --skipchecksums
# 3. Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
# 4. Update CHANGELOG
# 5. Update requirements.lock if upstream requirements.txt changed
./regen-lock.sh  # (if upstream requirements.txt changed)
# 6. Commit
git add PKGBUILD .SRCINFO CHANGELOG requirements.lock
git commit -m "upstream: bump to r<N>.<sha>"
# 7. Push
git push
```
