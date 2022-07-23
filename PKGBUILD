# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara-bin
pkgver=2.2.3beta
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://github.com/reckel-jm/cantara"
license=('GPL3')
groups=()
conflicts=('cantara')
depends=('qt5pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/releases/download/v2.2.3beta/cantara-$pkgver-x86_64.tar.gz")
md5sums=('b2e83c64954d71bcb6cb94436c2e4eef')
#noextract=("master.zip")
#md5sums=()
#validpgpkeys=()

package() {
	mkdir -p $pkgdir/usr/bin/
	#cd "$pkgname-$pkgver"
	#cd "$pkgname-$pkgver-x86_64"
	install cantara $pkgdir/usr/bin/cantara
	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	install languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	mkdir -p $pkgdir/usr/share/applications/
	install cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    mkdir -p $pkgdir/usr/share/icons/
    #install Cantara.png $pkgdir/usr/share/icons/cantara.png
}
