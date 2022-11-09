# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-ice-dark
pkgver=11_05_22
pkgrel=2
pkgdesc="This Numix clone is the dark version of OmNu-Ice. It features a dark and cool color scheme."
arch=('any')
url="https://www.jasong-designs.com/2022/01/01/omnu-ice-theme-collection/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'xfwm4: optional window manager theme')
changelog=
source=("https://github.com/jgpws/omnu-ice-dark/raw/main/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R OmNu-Ice-dark "$pkgdir/usr/share/themes"
}
sha256sums=('e6ac4948f4231f36045381939e89aa78b55458fe835bcc06dd3a3ef453b3e8d3')
