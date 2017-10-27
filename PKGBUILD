# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.392.0
pkgrel=1
_pkgfile="$pkgname-$pkgver-201710132322.$CARCH.rpm"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
makedepends=('rpmextract')
conflicts=()
replaces=()
backup=()
options=('emptydirs')
source=("http://www.geogebra.net/linux/rpm/$CARCH/$_pkgfile")
noextract=("$_pkgfile")
sha512sums=('0627e7a2ae80a655f1e670c8046491142dc8f8a0eca319cc0d4fd8ee969515eb22f482ec3c22f152545a0e056a517efef0bac328436afb896b85d526f60d9944')

build() {
	true
}

package() {
	cd "../pkg/$pkgname"
	cp "../../$_pkgfile" "$_pkgfile"
	rpmextract.sh "$_pkgfile"
	rm "$_pkgfile"
}
