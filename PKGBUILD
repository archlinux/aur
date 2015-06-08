# Maintainer: Max Bruckner
pkgname=oggextract
pkgver=1
pkgrel=1
pkgdesc="Extracts OGG Vorbis from binary files."
arch=( x86_64 i686)
url="http://moriya.ca/oggextract/"
source=("http://moriya.ca/${pkgname}/${pkgname}.c")
sha512sums=(478c960d2b5e344c69fe56d67fa45e394c56850505c2e17181a7d61b131b8d68fde84b4ebf78c8d1ecfab12dae81d2d8c0a710b389adf4bb99e8c22fe5224c1f)

build() {
	cd "$srcdir"
	make "$pkgname"
}

package() {
	cd "$srcdir"
	install -Dm '755' "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
