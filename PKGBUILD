# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: William Díaz <wdiaz [at] archlinus [dot] us>
# Contributor: Darío Andrés Rodríguez <andresbajotierra@gmail.com>

pkgname=ttf-fossfonts
pkgver=0.0.4
pkgrel=2
pkgdesc="A collection of 108 free GPL and Public Domain fonts."
arch=('any')
url="http://ftp.nl.freebsd.org/pub/pub/os/Linux/distr/zenwalk/i486/zenwalk-7.0/packages/extra/x/"
license=('GPL')
provides=(ttf-barcodes)
replaces=(ttf-barcodes)
install=$pkgname.install
source=(http://ftp.nl.freebsd.org/pub/pub/os/Linux/distr/zenwalk/i486/zenwalk-7.0/packages/extra/x/$pkgname-$pkgver-noarch-52.1.tgz)
md5sums=('fc50d41077f58f5edc62769e13092a9a')

package() {
  cd "$srcdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp * "$pkgdir/usr/share/fonts/TTF"
}

