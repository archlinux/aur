# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-clearurls-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-clearurls-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('37c1cde835de61db148bfb520e8e03447e027c321fe80df78c507c54e6043ff3')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
