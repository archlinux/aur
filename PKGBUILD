# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>
pkgname=amidimap
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc='Read in MIDI events, process them, and output them again.'
arch=('i686' 'x86_64')
url='http://cowlark.com/amidimap/'
license=('GPL2')
groups=()
depends=('alsa-lib')
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
source=("http://cowlark.com/amidimap/$pkgname-$pkgver.tar.bz2")
noextract=()
sha256sums=('2940fa73eeb63ee12863cbd697bd500c07524b27b555188ea960260c1cdc8ce1')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 amidimap "$pkgdir/usr/bin/amidimap"
}
