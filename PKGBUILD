pkgname=rgfw-git
pkgver=1.70
pkgrel=4
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
conflicts=( 'rgfw' )
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/heads/main.zip")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
	cd "RGFW-main"
	mkdir -p $pkgdir/usr/include
	cp RGFW.h $pkgdir/usr/include
	cp XDL.h $pkgdir/usr/include
}
