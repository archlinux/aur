# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.5.6
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=(any)
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=(python perl-image-exiftool)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ivandokov/phockup/archive/${pkgver}.tar.gz")
md5sums=('319d941229d9806cebbb2a4237bf2a4d')

package() {

  install -d ${pkgdir}/usr/share/${pkgname}
  cp ${srcdir}/${pkgname}-${pkgver}/phockup.py ${pkgdir}/usr/share/${pkgname}/phockup.py

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/phockup.py ${pkgdir}/usr/bin/phockup

  install -D ${srcdir}/${pkgname}-${pkgver}/license ${pkgdir}/usr/share/licenses/${pkgname}/MIT
}

