# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=omnu-champagne
pkgver=10_25_22
pkgrel=1
pkgdesc="A champagne colored GTK theme collection designed with Oomox"
arch=('any')
url="https://www.jasong-designs.com/2022/09/28/omnu-champagne/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'xfwm4: optional window manager theme')
changelog=
source=("https://github.com/jgpws/omnu-champagne/raw/main/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R OmNu-Champagne "$pkgdir/usr/share/themes"
}
sha256sums=('8273b88738a08201214899eab771730eb3e80e08f66d594faa6a6e1d260b1825')
