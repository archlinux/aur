# Maintainer:  Weirch Sodora <sodora at gmail dot com>
# Contributor: Tim Diels <limyreth at gmail dot com>
# Contributor: Sergej Pupykin <arch at sergej dot pp dot ru>
# Contributor: Nathaniel Harward <nharward at gmail dot com>
# Contributor: Martin Blumenstingl <martin.blumenstingl at googlemail dot com>
# Contributor: Erik van der Kolk <developer at smerik dot nl>
pkgname=selenium-server-standalone
pkgver=3.3.0
_pkgver=3.3
pkgrel=1
pkgdesc="Test automation server for web applications"
arch=('any')
url="http://seleniumhq.org/"
license=('APACHE')
depends=('java-runtime>=8')
source=("https://selenium-release.storage.googleapis.com/$_pkgver/$pkgname-$pkgver.jar"
        'Selenium.desktop')
noextract=("$pkgname-$pkgver.jar")
md5sums=('ac69327d0b6cf32440bedc0f08c626fd'
         'b8ae3f1e5d898bdbf00dec9b553472d2')

package() {
    cd "$srcdir"
    install -D -m0644 $pkgname-$pkgver.jar $pkgdir/usr/share/selenium-server/$pkgname.jar
    install -D -m0644 Selenium.desktop $pkgdir/etc/xdg/autostart/Selenium.desktop
}

