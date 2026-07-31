# anthropic-cli-bin

AUR packaging for [`ant`](https://github.com/anthropics/anthropic-cli), the official CLI
for the Claude API. Mirror of https://aur.archlinux.org/packages/anthropic-cli-bin

```sh
paru -S anthropic-cli-bin
ant auth login
```

Repackages the upstream release tarballs. Upstream's own `.pkg.tar.zst` installs the
binary to `/usr/ant` and takes the `ant` pkgname; this puts it in `/usr/bin` and ships the
shell completions, man page and license as well.

Conflicts with `extra/ant` (Apache Ant), since both own `/usr/bin/ant`. Does not declare
`provides=('ant')`, so it won't satisfy a dependency meant for Apache Ant. Everything in
the repos that needs Apache Ant needs it only as a makedepend.

## Updating

```sh
./update.sh          # or: ./update.sh 1.22.0
makepkg -f
git commit -am "Update to $(grep -oP '^pkgver=\K.*' PKGBUILD)"
git push && git push github
```

MIT, same as upstream.
