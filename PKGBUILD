# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-clearurls-bin
pkgver=1.27.0
pkgrel=2
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-clearurls-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('9a01efd835648cbbd2f3e08e88d323fcb53dcc3df600775f0945385cb019dad3')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
