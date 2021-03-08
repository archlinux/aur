# code-server-aur

Arch User Repository package for [code-server](https://github.com/cdr/code-server).
Feel free to file issues here or comment on the AUR page.

Previously maintained by [KSXGitHub](https://github.com/KSXGitHub)

## Updating

Make sure you run these commands on an Arch machine. If you're a Coder employee, we suggest using your dogfooding environment.

1. Update the `pkgver` in `PKGBUILD` to the latest version
2. Run `updpkgsums` to update the sha256 sums
	- If you don't have it installed, run `sudo pacman -S pacman-contrib`
3. Update the `.SRCINFO` by running:
```bash
# This is the file that is used by the AUR to show package info.
makepkg --printsrcinfo > .SRCINFO
```
4. Push changes to GitHub: `git push`
5. Push changes to `aur`: `git push aur`
	- If you don't have this set up, run `git remote add aur ssh://aur@aur.archlinux.org/code-server.git`
	- Run `git push aur`
