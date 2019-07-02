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
sha256sums=("cf60557a6ae17d63c80db23f98c1f9d96f1c7951ff968b0ba1f5777fbfbf9d37")

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$srcdir/$pkgname/wallo.sh" "$pkgdir/usr/bin/wallo"
	cp -v "$srcdir/$pkgname/wallo.man" "$pkgdir/usr/share/man/man1/wallo.1"
	gzip -v "$pkgdir/usr/share/man/man1/wallo.1"
}
