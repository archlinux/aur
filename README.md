# New ddev release:

* Bump `pkgver` key in `PKGBUILD`
* Update the `sha256sums` key appropriately
* Do _not_ bump `pkgrel` key
* `makepkg --printsrcinfo > .SRCINFO`
* Test that the package builds properly: `makepkg -s`
* If everything is good, `git add .SRCINFO PKGBUILD && git commit -m "Bumping ddev-bin version"`
* `git push`

# Using Docker to perform the release

If you're not running Arch as your main OS, you can perform the `makepkg` steps
inside of a docker container like so:

```bash
docker run --mount type=bind,source=$(pwd),target=/tmp/ddev-bin --workdir=/tmp/ddev-bin -it archlinux:latest bash
```

Once the container comes up, you'll need to install a couple of things:

```bash
pacman -Sy sudo binutils fakeroot docker docker-compose
```

You need sudo because `makepkg` refuses to run as root. `binutils` and `fakeroot`
are dependencies of `makepkg` that are somehow not installed in the Docker image
by default. `docker` and `docker-compose` are needed as dependencies of the `ddev-bin`
package, but you don't need to do anything special with them other than install
the packages so that `makepkg` doesn't complain.

You'll also need to set a password for `nobody` because `fakeroot` uses `sudo`:

```bash
passwd nobody
```

When you run `makepkg -s`, you'll be prompted for this password.

Finally, you'll need to preface the `makepkg` steps with `sudo -u nobody`.
