# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="pbk"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Backup and retrieve your files efficiently"
arch=("any")
url="https://gitlab.com/oktopod11/pbk"
license=("GPL")
groups=()
depends=("python")
makedepends=()
checkdepends=()
optdepends=()
provides=("pbk")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("752dc56799c8143fa2b6a3ee8aaea487b28076e88dfe17c4c7d8d1b700610cda")

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$srcdir/$pkgname/pbk.py" "$pkgdir/usr/bin/pbk"
	cp -v "$srcdir/$pkgname/pbk.man" "$pkgdir/usr/share/man/man1/pbk.1"
	gzip -v "$pkgdir/usr/share/man/man1/pbk.1"
}
