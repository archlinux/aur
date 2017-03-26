# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=yaah
pkgver=2.0.1
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://projects.metalgamer.eu/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://download.metalgamer.eu/yaah/$pkgname-$pkgver.tar.gz")
sha512sums=('8f13bed648d51d163dab3aae3db2983875a6e54b26446e0e983152d782dd79051cefdc07780dd428ea0b3609fd695f0b36515f10eaba84a4c25839a046a9ce5c')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}

# vim:set ts=2 sw=2 et:
