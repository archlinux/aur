# php-imagick-aur
An [AUR] package build for PHP's [imagick] extension.

## Building
You can of course build this package using [makepkg], but the recommended way
of building this package is using [Docker].  This can be done like so:

```bash
docker build --tag php-imagick-aur .
docker run --rm --volume "$(pwd):/package" php-imagick-aur
```

Alternatively, using [Docker Compose]:

```bash
docker-compose run build
```

This will start create a docker image tagged as php-imagick-aur and build the
package inside the container.  As a result you should get the built package in
your current directory.

## License
php-imagick-aur is licensed under the MIT license.  See [LICENSE] for the full
license text.

[AUR]: https://aur.archlinux.org/
[imagick]: http://pecl.php.net/package/imagick
[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
[Docker]: https://www.docker.com/
[Docker Compose]: http://docs.docker.com/compose/
[LICENSE]: https://github.com/nubs/php-imagick-aur/blob/master/LICENSE
