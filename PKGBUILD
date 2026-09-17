# Maintainer: Viktor-Alojzije Ćorić <viktor@viktoracoric.xyz>
pkgname=ma-sh
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Metal Archives Release Tracker - Track new releases for Metal Archives bookmarks"
arch=("any")
url="https://github.com/viktoracoric/ma.sh"
license=("GPL-3")
groups=()
<<<<<<< HEAD
depends=("bash" "sed" "grep" "tac")
=======
depends=("bash" "sed" "grep")
>>>>>>> 7a35b6e (OG commit - remove tac as dep)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://github.com/viktoracoric/ma.sh.git")
noextract=("git+https://github.com/viktoracoric/ma.sh.git")
sha256sums=("SKIP")

package() {
	cd "$srcdir/ma.sh/"
	mkdir -vp "$pkgdir/usr/local/bin/"
	make install DESTDIR="$pkgdir"
}

post_install() {
	echo 'Add "cookie" header from request headers on Metal Archives into COOKIE variable on top of the script'
}
