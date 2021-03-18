# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=30
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver})
sha256sums=('771045401398e5160345ed81c194d8310050f4624fa4a7daf1ec9e014134d35d')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
