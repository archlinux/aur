# Maintainer: Egor Gavrilov <gavrilovegor519-2 at yandex dot ru>
pkgname="osinfo-db-xinuos"
pkgver="20231215"
pkgrel="4"
pkgdesc="OSInfo metadata for SCO/Xinuos operating systems"
arch=("any")

source=("osinfo-db-xinuos-20231215-4.noarch.rpm")

sha256sums=("82da3caa64c874448631ebf88aba3fe15c1fc357ca0e84d33bc1c0b00c77548d")

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
