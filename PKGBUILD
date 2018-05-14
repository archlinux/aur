# Maintainer: Patrick Spek <aur+lonestar@tyil.work>

pkgname="lonestar"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Installer for Rakudo Star Perl 6"
arch=("any")
url="https://github.com/Tyil/lonestar"
license=("AGPL3")
depends=("bash")
makedepends=()
optdepends=()
provides=("lonestar")
conflicts=()
backup=("etc/lonestar/user.sh")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tyil/lonestar/archive/v$pkgver.tar.gz")
sha512sums=("414c6dc92fd415994885779fc1b545fa15b681f8d201b0b042ed11d9a99f9953539d0f1301bb6ed54485d5eeecf8fcba8dbe4f94bf88876b574700f77f25e5cc")

package() {
	cd -- "$pkgname-$pkgver" || exit 1
	make DESTDIR="$pkgdir/usr" install
}
