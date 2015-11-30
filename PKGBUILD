# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Lukas Kohler <lux@ontheblueplanet.com>
pkgname=chdkptp
pkgver=r690
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url="https://www.assembla.com/spaces/chdkptp"
license=('GPL' 'MIT')
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
changelog=
source=("https://www.assembla.com/spaces/chdkptp/documents/bEQP3wxwir5ikeacwqEsg8/download/bEQP3wxwir5ikeacwqEsg8" "chdkptp.sh" "chdkptp-gui.sh")
noextract=()
md5sums=("5832ba459c52f1cc045afdfb365dcb55" "d7946256ddd99be97592fd4df7d3ae86" "dbcda126bcdf108a8f20fe49d921cadc")
validpgpkeys=()

package() {
	install -Dm755 chdkptp $pkgdir/usr/lib/chdkptp/chdkptp
	install -Dm755 chdkptp_gui $pkgdir/usr/lib/chdkptp/chdkptp_gui
	install -dm644 "$pkgdir/usr/lib/chdkptp/lua/extras"
	install -m644 lua/*.lua "$pkgdir"/usr/lib/chdkptp/lua/
	install -m644 lua/extras/*.lua "$pkgdir"/usr/lib/chdkptp/lua/extras/
	install -Dm755 chdkptp.sh "$pkgdir"/usr/bin/chdkptp
	install -Dm755 chdkptp-gui.sh "$pkgdir"/usr/bin/chdkptp-gui
}
