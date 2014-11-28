# Maintainer: Jaroslav Lichtblau <dargonlord@aur.archlinux.org>

pkgname=newstap
pkgver=1.0.0
pkgrel=3
pkgdesc="Retrieve news from NNTP and deliver them to one or more destinations as regular electronic mail messages."
arch=('i686' 'x86_64')
url="http://amtrickey.net/newstap/"
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ec431267678a8cfdb6231895cac34ff6')

build() {
  cd "${srcdir}/$pkgname"

  make
}

package() {
  cd "${srcdir}/$pkgname"

  make PREFIX="${pkgdir}/usr" MAN="${pkgdir}/usr/share/man" install
}
