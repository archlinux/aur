pkgname=locator
pkgdesc="Unix command "locate" front-end. A Linux alternative to voidtool's "Everything", written in Lazarus."
pkgver=0.1.1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/AlexTuduran/Locator"
license=('Completely free')
source=(https://github.com/AlexTuduran/Locator/releases/download/v0.1.1-alpha/Locator-v$pkgver-alpha.zip)
md5sums=('SKIP')

package() {
	cd cd "Locator-v${pkgver}-alpha"
	mkdir -p ${pkgdir}/opt/locator/
	cp locator ${pkgdir}/opt/locator/
}