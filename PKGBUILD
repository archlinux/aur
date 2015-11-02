# Maintainer nullmark
# Old Maintainer: xduugu
pkgname=no-gconf
pkgver=20101030
pkgrel=1
pkgdesc="Get rid of GConf"
arch=('any')
url="http://there.is.none"
license=('GPL')
provides=("gconf=$pkgver")
conflicts=('gconf')

package() {
  install -dm755 "$pkgdir/usr/lib/"
  ln -s gconv/IBM1008_420.so "$pkgdir/usr/lib/libgconf-2.so.4"
}

# vim:set ts=2 sw=2 et:
