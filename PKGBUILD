pkgname=locator
pkgdesc="Unix command "locate" front-end. A Linux alternative to voidtool's "Everything", written in Lazarus."
pkgver=0.1.1
pkgrel=6
arch=('i686' 'x86_64')
url="https://github.com/AlexTuduran/Locator"
license=('Completely free')
source=(https://github.com/AlexTuduran/Locator/releases/download/v$pkgver-alpha/Locator-v$pkgver-alpha.zip
	Locator.desktop)
md5sums=('SKIP')
depends=('mlocate' 'gksu')

package() {
	install -D $srcdir/Locator.desktop ${pkgdir}/usr/share/applications/Locator.desktop
	install -D $srcdir/Locator-v$pkgver-alpha/locator $pkgdir/opt/locator/locator
	install -D $srcdir/Locator-v$pkgver-alpha/locator.png $pkgdir/opt/locator/locator.png
}
