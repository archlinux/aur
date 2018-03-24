# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=yaah
pkgver=2.0.2
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://projects.metalgamer.eu/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://download.metalgamer.eu/yaah/$pkgname-$pkgver.tar.gz")
sha512sums=('7f7de775b31a3480405bc0ad040ae16a44d7214ed0086b36b75f4e8ea8b76228be94afeea01bfb55351eaebbba40e86ce6fa9cf0d1919ee3187e10a1322f85ba')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}

# vim:set ts=2 sw=2 et:
