# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-ice
pkgver=10_05_22
pkgrel=2
pkgdesc="A cool, light blue/gray theme collection designed in Oomox"
arch=('any')
url="https://www.jasong-designs.com/2022/01/01/omnu-ice-theme-collection/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'xfwm4: optional window manager theme')
changelog=
source=("https://github.com/jgpws/omnu-ice/raw/main/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R OmNu-Ice "$pkgdir/usr/share/themes"
}

sha256sums=('3753d4a42eec0553a655c9736903cf56e87dbbdc06ac34db94ceca6f71899c74')
