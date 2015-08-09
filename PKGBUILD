# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=yaah
pkgver=0.6.3
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://bitbucket.org/the_metalgamer/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
source=("https://bitbucket.org/the_metalgamer/yaah/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('b80f34725dd7cfdf592ea1211afa920265ec45c5dff144474cf00a6e176adbf4a5bcc72fa9081bd3bcb7392d3e72ffe38db22c1f31b50764218909a4ebb27387')

package() {

  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}
# vim:set ts=2 sw=2 et:
