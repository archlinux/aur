# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara-bin
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://www.cantara.app"
license=('GPL3')
groups=()
conflicts=('cantara')
depends=('qt5pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/releases/download/v$pkgver/cantara-$pkgver-x86_64_bin.zip")
md5sums=('bac027ce138501bf8e572296973ce8a4')

package() {
	mkdir -p $pkgdir/usr/bin/
	install cantara $pkgdir/usr/bin/cantara
	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	install languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	mkdir -p $pkgdir/usr/share/applications/
	install cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    mkdir -p $pkgdir/usr/share/icons/
    install Cantara.png $pkgdir/usr/share/icons/cantara.png
}
