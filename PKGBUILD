# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=yaah
pkgver=1.1.0
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://bitbucket.org/the_metalgamer/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://bitbucket.org/the_metalgamer/yaah/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('0b1973d7856f8a07609510799fd4c7784a73bc733f83cfa1f004373df391e8ddcc62c80f0e4530bc7a97988ae9183bba0a14c57544d5d1e034b037ea00db8b37')

package() {

  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}
# vim:set ts=2 sw=2 et:
