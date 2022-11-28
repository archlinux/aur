# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-keepassxc-browser-bin
pkgver=1.8.3.1
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-keepassxc-browser-aur"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$url/releases/download/$pkgver/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('5f9e6c730291c392f1e9f5b3200d76ed63d7736f76ddc19627176989a38cd480')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
