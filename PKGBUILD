# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-clearurls-bin
pkgver=1.27.0
pkgrel=3
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-clearurls-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('5233fc507a70ccb6e2d8d4bc8fe25c6ddb08b454dc7b25ef642b4f027db29953')
depends=('chromium')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

package() {
    cp -R "$srcdir/usr/" "$pkgdir/usr"
}
