# Maintainer: Max Bruckner
pkgname=oggextract
pkgver=2
pkgrel=2
pkgdesc="Extracts OGG Vorbis from binary files."
arch=( x86_64 i686)
url="https://github.com/FSMaxB/oggextract/"
source=("git+https://github.com/FSMaxB/${pkgname}.git#commit=3726a80cd7206fd256a0d977dfdbd1df29c410ed")
makedepends=('git')
md5sums=( SKIP )

build() {
	cd "$srcdir/$pkgname"
	make "$pkgname"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm '755' "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
