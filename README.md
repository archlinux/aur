# code-server-aur

Arch User Repository package for [code-server](https://github.com/cdr/code-server).
Feel free to file issues here or comment on the AUR page.

Previously maintained by [KSXGitHub](https://github.com/KSXGitHub)

## Updating

If there are no breaking changes with the release, updating the package is as
simple as updating `pkgver` in `PKGBUILD` to the new version. Make sure
to run `updpkgsums` to update the sha256 sums.

After updating, run this command on an Arch machine to update the `.SRCINFO`.
This is the file that is used by the AUR to show package info.

```bash
makepkg --printsrcinfo > .SRCINFO
```

Then, just push to the AUR git repo. You'll have to maintain two remotes in
your `.git/config`. Mine is setup as so

```
[remote "origin"]
	url = git@github.com:/cdr/code-server-aur.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[remote "aur"]
	url = ssh://aur@aur.archlinux.org/code-server.git
	fetch = +refs/heads/*:refs/remotes/aur/*
```

Then it's as simple as `git push` to push to GitHub and `git push aur` to
update the AUR.
