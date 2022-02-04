# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-ice
pkgver=01_04_22
pkgrel=1
pkgdesc="A cool, light blue/gray theme collection designed in Oomox"
arch=('any')
url="https://www.jasong-designs.com/2022/01/01/omnu-ice-theme-collection/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine')
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'xfwm4: optional window manager theme')
changelog=
source=("https://github.com/jgpws/omnu-ice/raw/main/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R OmNu-Ice "$pkgdir/usr/share/themes"
}
sha256sums=('385aeca773689dfa89056d333e3e2ea539d6682599eaccc42bc1eef9b1062a68')
