# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=marg
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Simple argument handling library for C programs"
arch=("x86_64")
url="https://gitlab.com/oktopod11/marg"
license=("LGPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("marg")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("1c5d7fbccbcbb32d265c54372f450f8c25f1fda4ada0d26fc11774a86a4b7b18")

package() {
	mkdir -vp "$pkgdir/usr/include/"
	mkdir -vp "$pkgdir/usr/share/man/man3/"
	cp -rv "$srcdir/$pkgname/lib/" "$pkgdir/usr/include/marg/"
	cp -v "$srcdir/$pkgname/marg.man" "$pkgdir/usr/share/man/man3/marg.3"
	gzip -v "$pkgdir/usr/share/man/man3/marg.3"
}
