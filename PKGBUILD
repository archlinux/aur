# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=31
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver})
sha256sums=('89602b9391241cbc9795c95d012f34f594b67703baf68e3fc82e5477941ec1ca')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
