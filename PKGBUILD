# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=polygen-data
pkgver=1.0.6
pkgrel=3
pkgdesc="Data files for polygen"
arch=('i686' 'x86_64')
url="http://polygen.org/"
license=('GPL')
source=(http://lapo.it/polygen/polygen-$pkgver-20110201-grm.zip)
md5sums=('cdb53a913772868ea453205497a852da')

package() {
  cd "${srcdir}/eng"

  install -d "${pkgdir}/usr/share/polygen"
  cp -R * "${pkgdir}/usr/share/polygen"

#fixing file rights
  find "${pkgdir}/usr" -type f -exec chmod 644 "{}" \;
}
