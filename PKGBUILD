# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-caja
pkgver=3.4.2.40983
pkgrel=1
pkgdesc="Caja integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=(
	'caja'
	'insync'
	'insync-emblem-icons'
	'python-caja'
)
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('5d1d5cb31391dbf0c032061b354a960cf787f352ae10d165193b920df75dd570')

package() {
   tar xf data.tar.gz
   cp -rp usr "${pkgdir}"
}
