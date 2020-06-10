# Maintainer: Franck Stauffer <franck.stauffer@telecom-sudparis.eu>

pkgname='firefox-extension-cookie-autodelete'
pkgver=3.3.1
pkgrel=1
pkgdesc="Firefox extension that automatically deletes cookies."
license=('MIT')
arch=('any')
url="https://github.com/Cookie-AutoDelete/Cookie-AutoDelete"
depends=('firefox')
groups=('firefox-addons')
source=("$pkgname-$pkgver.xpi::https://github.com/Cookie-AutoDelete/Cookie-AutoDelete/releases/download/v${pkgver}/Cookie-AutoDelete_v${pkgver}_Firefox.xpi")
noextract=("$pkgname-$pkgver.xpi")
b2sums=('4a9108a0cb9ca21e100b7205f9fce1a0fb9109a56ed07b11132a6f0c60893191f589f31fd44120bb72b9d90b8c705e8169a1a4d005dbb0d4a9f4bfff7b529101')

package() {
    install -Dm644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CookieAutoDelete@kennydo.com.xpi"
}
