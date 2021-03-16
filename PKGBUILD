# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=29
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver})
sha256sums=('a6e4b73f92810d190dbdbc13f99705e42c705da23fb30f60aec1a57f6c69d890')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
