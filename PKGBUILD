# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=insync-emblem-icons
pkgver=3.4.2.40983
pkgrel=1
pkgdesc="File manager emblem icons for Insync file manager extensions"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
_conflictver=3.4.1
conflicts=(
	"insync-caja<=${_conflictver}"
	"insync-dolphin<=${_conflictver}"
	"insync-nautilus<=${_conflictver}"
	"insync-nemo<=${_conflictver}"
)
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('c7630d573e44c41cd6da68fa94dcc35da7ab1f89b766478e77763e0eb18bf162')

package() {
   tar xf data.tar.gz
   cp -rp usr "${pkgdir}"
}
