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
sha256sums=("0e432a02911cb377a9b4edfe725d4b6adfcf1fa66a1c445a5eae1467b373ae51")

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$srcdir/$pkgname/pbk.py" "$pkgdir/usr/bin/pbk"
	cp -v "$srcdir/$pkgname/pbk.man" "$pkgdir/usr/share/man/man1/pbk.1"
	gzip -v "$pkgdir/usr/share/man/man1/pbk.1"
}
