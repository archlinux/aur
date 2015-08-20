# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=yaah
pkgver=1.0.0
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://bitbucket.org/the_metalgamer/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
source=("https://bitbucket.org/the_metalgamer/yaah/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('bbb9b3b335fdfa2b353cf1faeb72d17bc7e2bc75d48d4f7b80cf9e10e04cc465031f3e0881db5ab5a625992878192d189ae664d16e3e63b10add67da4a3f053a')

package() {

  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}
# vim:set ts=2 sw=2 et:
