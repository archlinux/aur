# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=yaah
pkgver=1.1.1
pkgrel=1
pkgdesc="Yet another AUR helper"
arch=('any')
url="https://bitbucket.org/the_metalgamer/yaah"
license=('GPL3')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
source=("https://bitbucket.org/the_metalgamer/yaah/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('f61909e305d1f8b24594d38ebc9eb8bb94d9967503c5fb75f0567feb10a8b8ec405a894da16da896f3069439995fed7d227a207d0f33940c3823e16d8e98c92c')

package() {

  cd $srcdir/$pkgname-$pkgver
  install -D -m755 yaah "${pkgdir}/usr/bin/yaah"
  install -D -m644 man/man8/yaah.8.gz "${pkgdir}/usr/share/man/man8/yaah.8.gz"
  install -D -m644 yaah.completion "${pkgdir}/etc/bash_completion.d/yaah"
}
# vim:set ts=2 sw=2 et:
