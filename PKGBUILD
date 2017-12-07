# Maintainer: Sam Rogers <sjr@samrogers.org>
pkgname=cnstrokeorder
pkgver=0.0.4.7
pkgrel=1
epoch=
pkgdesc="simplified hanzi stroke order font"
arch=(any)
url="http://rtega.be/chmn/"
license=('Arphic Public License')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_fontFilename="CNstrokeorder-0.0.4.7.ttf"
source=("http://rtega.be/chmn/${_fontFilename}")
noextract=()
sha256sums=('618b4e714bedd55d03c00b3fbdff4a96d726602149362aefc231b238ae09a486')
validpgpkeys=()

package() {
	install -d "$pkgdir/usr/share/fonts/${pkgname}"
	install -t "$pkgdir/usr/share/fonts/${pkgname}/" "${_fontFilename}"
}
