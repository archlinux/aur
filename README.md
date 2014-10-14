# php-gnupg-aur
An [AUR] package build for PHP's [gnupg] extension.

## Building
You can of course build this package using [makepkg], but the recommended way
of building this package is using [Docker].  This can be done like so:

```bash
docker build --tag php-gnupg-aur .
docker run --rm --volume "$(pwd):/package" php-gnupg-aur
```

Alternatively, using [Fig]:

```bash
fig run build
```

This will start create a docker image tagged as php-gnupg-aur and build the
package inside the container.  As a result you should get the built package in
your current directory.

[AUR]: https://aur.archlinux.org/
[gnupg]: http://pecl.php.net/package/gnupg
[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
[Docker]: https://www.docker.com/
[Fig]: http://www.fig.sh/
