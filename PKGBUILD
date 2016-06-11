# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=25
pkgrel=2
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver})
sha256sums=('e2297e414d424cded59ea68e497115645232941070ae20da1fc8708a694b1afa')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
