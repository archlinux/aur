# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=yaah
pkgver=0.6.5
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://bitbucket.org/the_metalgamer/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
source=("https://bitbucket.org/the_metalgamer/yaah/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('fdab55669b5f396716475601c88dc030c031980a3e1cb2ca0ec840f3aa50bd885aafe946f2983111ce57abf795159bcaa38a641622beafc944b06050d43bb65c')

package() {

  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}
# vim:set ts=2 sw=2 et:
