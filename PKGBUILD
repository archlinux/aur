# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="pbk"
pkgver=0.2
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
sha256sums=("89f57f94df8ea7f0c2e308a0a6f16912cde3b2ea8359cd613daf52d8796a0647") 

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$srcdir/$pkgname/pbk.py" "$pkgdir/usr/bin/pbk"
	cp -v "$srcdir/$pkgname/pbk.man" "$pkgdir/usr/share/man/man1/pbk.1"
	gzip -v "$pkgdir/usr/share/man/man1/pbk.1"
}
