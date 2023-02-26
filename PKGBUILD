# Maintainer: Viktor-Alojzije Ćorić <viktor@viktoracoric.xyz>
pkgname=biblija
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Čitajte Bibliju (prijevod Kršćanske sadašnjosti, uključuje i apokrife) u terminalu."
arch=("any")
url="https://github.com/viktoracoric/biblija"
license=("The Unlicense")
groups=()
depends=("bash" "coreutils" "gawk" "sed" "ncurses" "tar")
makedepends=()
checkdepends=()
optdepends=("less: for better preview")
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://github.com/viktoracoric/biblija.git")
noextract=("git+https://github.com/viktoracoric/biblija.git")
sha256sums=("SKIP")

package() {
	cd "$srcdir/biblija/"
	mkdir -vp "$pkgdir/usr/local/bin/"
	make install DESTDIR="$pkgdir"
}
