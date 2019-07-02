# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=marg
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Simple argument handling library for C programs"
arch=("any")
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
sha256sums=("736101e4c12fd4e1057baf77cd0941fe3e1f5a3118a3f8abdecebd17231cd510")

package() {
	mkdir -vp "$pkgdir/usr/include/"
	mkdir -vp "$pkgdir/usr/share/man/man3/"
	cp -rv "$srcdir/$pkgname/lib/" "$pkgdir/usr/include/marg/"
	cp -v "$srcdir/$pkgname/marg.man" "$pkgdir/usr/share/man/man3/marg.3"
	gzip -v "$pkgdir/usr/share/man/man3/marg.3"
}
