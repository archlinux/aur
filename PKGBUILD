# Maintainer: Anthony Trezza <anthony<delete_this>.t<remove_this>.trezza<destroy_this>@gmail.com>
# Special Thanks: giacomogallina for making this pkgbuild
pkgname=go2
pkgver=0.3
pkgrel=1
#epoch=
pkgdesc="A handy tool for quick navigation to commonly used directories"
arch=('any')
url="https://github.com/ControlxFreak/go2"
license=('MIT')
groups=()
depends=('bash')
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
source=("https://github.com/ControlxFreak/go2/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('a40f86622a802d35382c7c0c4fb24a28')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/profile.d/"
	cp "go2" "$pkgdir/usr/bin/go2"
	cp "nickname" "$pkgdir/usr/bin/nickname"
	echo "alias go2='. go2'" > "$pkgdir/etc/profile.d/go2.sh"
}
