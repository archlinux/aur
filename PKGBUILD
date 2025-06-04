pkgname=rgfw
pkgver=1.70
pkgrel=3
epoch=
pkgdesc="A cross platform lightweight single-header simple-to-use window abstraction library for creating graphical programs or libraries."
arch=(any)
url="https://github.com/ColleagueRiley/RGFW"
license=('zlib')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(
	'xorg-server: X11 Support'
	'wayland: Wayland Support (experimental)'
)
provides=('RGFW')
conflicts=( 'rgfw-git' )
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/$pkgver.zip")
noextract=()
sha256sums=('c0b6f4ecabd186b37ff1e10ba49644d9f11bb950b485618cbfb203948871d0c3')
validpgpkeys=()

package() {
	cd "RGFW-$pkgver"
	mkdir -p $pkgdir/usr/include
	cp RGFW.h $pkgdir/usr/include
	cp XDL.h $pkgdir/usr/include
}
