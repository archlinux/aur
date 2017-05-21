# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=seasonproxer
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/SeasonProxer"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-datasync' 'qt5-restclient')
makedepends=('qpm')
source=('https://install.skycoder42.de/pkg/SeasonProxer.tar.gz')
sha256sums=('710c79f4204d77b576259b357e5e3111ec22d48be421d2bbedf44e63cbd27563')

package() {
	install -D -m 755 -p SeasonProxer $pkgdir/usr/bin/SeasonProxer
	install -D -m 644 -p de.skycoder42.SeasonProxer.desktop $pkgdir/usr/share/applications/de.skycoder42.SeasonProxer.desktop
	install -D -m 644 -p main_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/SeasonProxer.png"
	install -D -m 644 -p main_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/SeasonProxer.png"
	install -D -m 644 -p main_24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/SeasonProxer.png"
	install -D -m 644 -p main_22.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/SeasonProxer.png"
	install -D -m 644 -p main_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/SeasonProxer.png"
}
