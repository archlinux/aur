# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara-bin
pkgver=2.6.0
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://www.cantara.app"
license=('GPL3')
groups=()
conflicts=('cantara')
depends=('qt6pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/releases/download/v$pkgver/cantara-$pkgver-linux-x86_64_bin.tar.gz")
md5sums=('1339e14042cb5d25b7133962aec1eded')

package() {
	mkdir -p $pkgdir/usr/bin/
	install -D cantara $pkgdir/usr/bin/cantara
	install -D languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	install -D languages/zh/cantara.mo $pkgdir/usr/share/locale/zh/LC_MESSAGES/cantara.mo
	install -D languages/it/cantara.mo $pkgdir/usr/share/locals/it/LC_MESSAGES/cantara.mo
	install -D languages/es/cantara.mo $pkgdir/usr/share/locals/es/LC_MESSAGES/cantara.mo
	install -D languages/nl/cantara.mo $pkgdir/usr/share/locals/nl/LC_MESSAGES/cantara.mo
	install -D app.cantara.Cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
	install -D app.cantara.Cantara.png $pkgdir/usr/share/icons/app.cantara.Cantara.png
	mkdir -p $pkgdir/usr/share/cantara/
	cp -r backgrounds $pkgdir/usr/share/cantara/
}
