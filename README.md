# php-oci8-aur
An [AUR] package build for PHP's [OCI8] extension.

## Building
You can of course build this package using [makepkg], but the recommended way
of building this package is using [Docker].  This can be done like so:

```bash
docker build --tag php-oci8-aur .
docker run --rm --volume "$(pwd):/package" php-oci8-aur
```

Alternatively, using [Fig]:

```bash
fig run build
```

This will start create a docker image tagged as php-oci8-aur and build the
package inside the container.  As a result you should get the built package in
your current directory.

[AUR]: https://aur.archlinux.org/
[oci8]: http://pecl.php.net/package/oci8
[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
[Docker]: https://www.docker.com/
[Fig]: http://www.fig.sh/
