pkgname=locator
pkgdesc="Unix command "locate" front-end. A Linux alternative to voidtool's "Everything", written in Lazarus."
pkgver=0.1.1
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/AlexTuduran/Locator"
license=('Completely free')
source=(https://github.com/AlexTuduran/Locator/releases/download/v0.1.1-alpha/Locator-v$pkgver-alpha.zip)
md5sums=('SKIP')

package() {
	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/../Locator.desktop ${pkgdir}/usr/share/applications
	mkdir -p $pkgdir/opt/locator/
	cp $srcdir/Locator-v$pkgver-alpha/locator $pkgdir/opt/locator/
	cp $srcdir/Locator-v$pkgver-alpha/locator.png $pkgdir/opt/locator/
}