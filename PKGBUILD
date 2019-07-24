# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=wallo
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="Wallpaper organizer"
arch=("any")
url="https://gitlab.com/oktopod11/wallo"
license=("GPL")
groups=()
depends=("bash" "file" "coreutils" "gawk" "sed" "imagemagick")
makedepends=()
checkdepends=()
optdepends=()
provides=("wallo")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("f4a9c6afda0291d3a0758e3cd75f41c66c44ebf198223ea9c78d58afc1dd8e9b")

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$srcdir/$pkgname/wallo.sh" "$pkgdir/usr/bin/wallo"
	cp -v "$srcdir/$pkgname/wallo.man" "$pkgdir/usr/share/man/man1/wallo.1"
	gzip -v "$pkgdir/usr/share/man/man1/wallo.1"
}
