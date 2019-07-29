# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=tapclean
pkgver=0.38
pkgrel=1
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tapclean"
license=('GPL2')
depends=()
source=("https://sourceforge.net/projects/tapclean/files/tapclean/TAPClean%20${pkgver}/${pkgname}-${pkgver}-src.tgz")
md5sums=('e6489783241bb30affdb33d19fff04fb')


#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "${srcdir}/${pkgname}/src"
  make CFLAGS+=
}

package() {
  cd "${srcdir}/${pkgname}/src"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}
