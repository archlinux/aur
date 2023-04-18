# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-clearurls-bin
pkgver=1.26.0
pkgrel=2
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-clearurls-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('66b876ad4b30bfbf7e00119d74d806588c9b01f24870e37c2dd95d60deddaf6f')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
