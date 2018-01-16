# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=tapclean
pkgver=0.36
pkgrel=1
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tapclean"
license=('GPL2')
depends=()
source=("https://sourceforge.net/projects/tapclean/files/tapclean/TAPClean%20${pkgver}/${pkgname}-${pkgver}-src.tgz")
md5sums=('f3501026f857d4af78bac8872c0f1e27')

#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "${srcdir}/${pkgname}"
  make CFLAGS+=
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}
