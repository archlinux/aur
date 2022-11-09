# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-ice
pkgver=10_26_22
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
sha256sums=('26e858214f6d167bca0b5b293601292910f5e69231b9df7f8ed61eb849cb5670')
