# Maintainer:  Weirch Sodora <sodora at gmail dot com>
# Contributor: Tim Diels <limyreth at gmail dot com>
# Contributor: Sergej Pupykin <arch at sergej dot pp dot ru>
# Contributor: Nathaniel Harward <nharward at gmail dot com>
# Contributor: Martin Blumenstingl <martin.blumenstingl at googlemail dot com>
# Contributor: Erik van der Kolk <developer at smerik dot nl>
pkgname=selenium-server-standalone
pkgver=3.0.0_beta3
_pkgver=3.0.0-beta3
pkgrel=1
pkgdesc="Test automation server for web applications"
arch=('any')
url="http://seleniumhq.org/"
license=('APACHE')
depends=('java-runtime>=6')
source=("http://selenium-release.storage.googleapis.com/3.0-beta3/$pkgname-$_pkgver.jar"
        'Selenium.desktop')
noextract=("$pkgname-$_pkgver.jar")
md5sums=('5c97631ccb1f92eb9f682cd845611738'
         'b8ae3f1e5d898bdbf00dec9b553472d2')

package() {
    cd "$srcdir"
    install -D -m0644 $pkgname-$_pkgver.jar $pkgdir/usr/share/selenium-server/$pkgname.jar
    install -D -m0644 Selenium.desktop $pkgdir/etc/xdg/autostart/Selenium.desktop
}

