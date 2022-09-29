# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-keepassxc-browser-bin
pkgver=1.8.2.2
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-keepassxc-browser-aur"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$url/releases/download/$pkgver/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('16bc69c2705d3e470d61d395e598df05fbdd24f33b731dfda4bf446677ae8a7a')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
