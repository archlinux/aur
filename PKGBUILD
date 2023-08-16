# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-keepassxc-browser-bin
pkgver=1.8.7
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-keepassxc-browser-aur"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$url/releases/download/$pkgver/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('798c2d4f5e1b91097d5191d7048b27d4e1b922aaa7c449de46aafe12a5e8b7a9')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
