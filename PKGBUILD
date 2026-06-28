# Maintainer: corvus_192 <rua@jendrik.eu>
pkgname=eurkey
pkgver=1.2
pkgrel=1
epoch=
pkgdesc=""
arch=(any)
url="http://eurkey.steffen.bruentjen.eu"
license=('GPL-3.0-only')
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
source=("https://eurkey.steffen.bruentjen.eu/download/debian/binary/eurkey.deb")
noextract=()
sha256sums=(2dd227e75501a624b97288d4c538ac5698ba9c1c53fa4da6c8e3a519d9a52d0f)
validpgpkeys=()

package() {
	tar xf data.tar.xz
	cp -r "$srcdir/usr" "$pkgdir/usr"
	mv "$pkgdir/usr/share/X11/xkb/symbols/eurkey"{-1.2,}
}
