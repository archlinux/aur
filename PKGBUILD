# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=yaah
pkgver=3.0.0
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://projects.metalgamer.eu/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://download.metalgamer.eu/yaah/$pkgname-$pkgver.tar.gz")
sha512sums=('8aff58ca023ff9b20f23a93b248078c2c8fc7d3a826d8b5ae8b4884ba28fe9ca25bd196520258800afe4e09fb01c9f2f843c1342fe3a37f03401ccaf717dcf24')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}

# vim:set ts=2 sw=2 et:
