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
source=("http://www.geogebra.net/linux/rpm/$CARCH/$_pkgfile")
sha256sums=('d824b1a379c85305e5ce1243b493da80489035f9260a49c8c224fd49c2de6e6e')

prepare() {
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
