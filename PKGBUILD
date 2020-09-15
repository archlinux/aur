# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=rovclock
pkgver=0.6e
pkgrel=1
pkgdesc="ATI Radeon overclocking utility"
arch=('i686' 'pentium4' 'x86_64')
url="http://www.hasw.net/linux/"
license=('GPL2')
makedepends=()
depends=()
source=("http://www.hasw.net/linux/rovclock-${pkgver}.tar.bz2")
sha1sums=('bc6aa6f0b083d3d2b9e8db0caf09800b29dfd6b5')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
  install -Dm755 rovclock "${pkgdir}/usr/bin/rovclock"
}

# vim:set ts=2 sw=2 et:
