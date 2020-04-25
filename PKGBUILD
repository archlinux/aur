# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=28
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver})
sha256sums=('7ad80472ae82c3d2d66322ff8849582b7a643fff80f6e41df29e9c1d9db3aa74')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
