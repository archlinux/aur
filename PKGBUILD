# Maintainer: theferdi265 at gmail dot com

pkgname=gtk-theme-numix-solarized
pkgver=20210831
pkgrel=1
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme, compatible with GTK 3.20"
arch=('any')
url="https://github.com/Ferdi265/numix-solarized-gtk-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("https://github.com/Ferdi265/numix-solarized-gtk-theme/releases/download/$pkgver/NumixSolarized-$pkgver.tar.gz")
sha256sums=('25f2e3bc899ed15461b6e9bf30566ecd5ebc742ebac93f0416e42c2b020559e6')

package() {
	mkdir -p $pkgdir/usr/share/themes
	mv NumixSolarized/* $pkgdir/usr/share/themes
}

