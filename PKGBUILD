# Maintainer: Uffe Jakobsen <_ microtop _at_ starion.dk _>

pkgname=tapclean
pkgver=0.38
pkgrel=1
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://tapclean.sourceforge.io/"
license=('GPL-2.0-only')
depends=()
conflicts=("tapclean.git")
source=("https://sourceforge.net/projects/tapclean/files/tapclean/TAPClean%20${pkgver}/${pkgname}-${pkgver}-src.tgz")
md5sums=('e6489783241bb30affdb33d19fff04fb')


#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build()
{
  cd "${srcdir}/${pkgname}/src"
  make CFLAGS+=
}

package()
{
  cd "${srcdir}/${pkgname}/src"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}

# EOF
