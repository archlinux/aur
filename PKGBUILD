# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=yaah
pkgver=3.0.1
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://projects.metalgamer.eu/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://download.metalgamer.eu/yaah/$pkgname-$pkgver.tar.gz")
sha512sums=('190edb2541807f9a3c363afae4eee79d1c8b15230223e160f703c11eb28170bfea00b49119c5e91b0a2fd0461805649dc99e52f5bc466209b5b0702c3445afd6')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}

# vim:set ts=2 sw=2 et:
