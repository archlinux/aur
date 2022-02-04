# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-ice-dark
pkgver=01_04_22
pkgrel=1
pkgdesc="This Numix clone is the dark version of OmNu-Ice. It features a dark and cool color scheme."
arch=('any')
url="https://www.jasong-designs.com/2022/01/01/omnu-ice-theme-collection/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine')
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'xfwm4: optional window manager theme')
changelog=
source=("https://github.com/jgpws/omnu-ice-dark/raw/main/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R OmNu-Ice-dark "$pkgdir/usr/share/themes"
}
sha256sums=('fc5bd3f2d5fe9c33659d779ba0cb9a01e3d4411ad6e2cbab1d9270a228c61e18')
