# Maintainer: theferdi265 at gmail dot com

pkgname=gtk-theme-numix-solarized
pkgver=20160919
pkgrel=2
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme, compatible with GTK 3.20"
arch=('any')
url="https://github.com/Ferdi265/numix-solarized-gtk-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("https://github.com/Ferdi265/numix-solarized-gtk-theme/releases/download/$pkgver/NumixSolarized-$pkgver.tar.gz")
md5sums=('3649953306ed02961b6df0862912e674')

package() {
	mkdir -p $pkgdir/usr/share/themes
	mv NumixSolarized $pkgdir/usr/share/themes
	mv NumixSolarizedDark $pkgdir/usr/share/themes
}

