# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=netstiff
pkgver=20080331
pkgrel=2
pkgdesc="A powerful Web and FTP site update checker"
arch=('any')
url="http://pkqs.net/~sbeyer/#netstiff"
license=('GPL3')
depends=('ruby')
source=(http://pkqs.net/~sbeyer/tools/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('afb24c1c966228664368f770dc42c021')

build() {
  cd "${srcdir}"/${pkgname}_${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}_${pkgver}
  make DESTDIR="${pkgdir}"/usr install
}
