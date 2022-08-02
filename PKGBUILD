# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara-bin
pkgver=2.3
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://reckel-jm.github.io/cantara-song/"
license=('GPL3')
groups=()
conflicts=('cantara')
depends=('qt5pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/releases/download/v$pkgver/cantara-$pkgver-x86_64_bin.tar.gz")
md5sums=('ba0180e20c49fdceebd1ed2dd5462469')

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
