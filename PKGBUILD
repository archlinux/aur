# Maintainer: Franck Stauffer <franck.stauffer@telecom-sudparis.eu>

pkgname='firefox-extension-cookie-autodelete'
pkgver=3.4.0
pkgrel=1
pkgdesc="Firefox extension that automatically deletes cookies."
license=('MIT')
arch=('any')
url="https://github.com/Cookie-AutoDelete/Cookie-AutoDelete"
depends=('firefox')
groups=('firefox-addons')
source=("$pkgname-$pkgver.xpi::https://github.com/Cookie-AutoDelete/Cookie-AutoDelete/releases/download/v${pkgver}/Cookie-AutoDelete_v${pkgver}_Firefox.xpi")
noextract=("$pkgname-$pkgver.xpi")
b2sums=('af8eb3ea51363e5e132dfaa95b0e36e5bac1b87e8f085adee6493196e00591b2821e3f67a09f0454c8f5293df057d4f2d896bf374139eb5b732b046becaa2c8b')

package() {
    install -Dm644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CookieAutoDelete@kennydo.com.xpi"
}
