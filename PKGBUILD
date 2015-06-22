# Maintainer: Lubosz Sarnecki <lubosz at gmail>

pkgname=aria-robot
pkgver=2.8.1
distname=Aria-${pkgver}
pkgrel=2
pkgdesc='MobileRobots Advanced Robot Interface for Applications. A C++ library for MobileRobots/ActivMedia platforms.'
arch=('x86_64')
url='http://robots.mobilerobots.com/wiki/ARIA'
license=('GPL2')
depends=()
makedepends=()
source=(http://robots.mobilerobots.com/ARIA/download/current/ARIA-2.8.1+x86_64+gcc4.6.tgz)
sha256sums=('616b62334b1325b9fa7ac2b98e3e8b81695a08609a4dc8bfc3cb9071debaa116')

build() {
  cd ${srcdir}/${distname}
  make
}

package() {
  cd ${srcdir}/${distname}
  make DESTDIR=$pkgdir install
}
