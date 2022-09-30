# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-copy-url-on-hover-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="Copy URL On Hover - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-copy-url-on-hover-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('068200ef6627f20b9654cd0ba2bc974815a1bd97f9736bdac7ebb1eb4ae32fe1')
provides=('chromium-extension-copy-url-on-hover')
conflicts=('chromium-extension-copy-url-on-hover')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
