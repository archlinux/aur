# Maintainer: Damian "G'lek" Mulligan <glek@glektarssza.com>
# Contributor: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-keepassxc-browser-bin
pkgver=1.9.11
pkgrel=1
pkgdesc="KeePassXC Browser Integration - Chromium (binary version)"
arch=('any')
url="https://github.com/glektarssza/chromium-extension-keepassxc-browser-aur"
license=('GPL3')
makedepends=('chromium' 'openssl' 'jq')
source=("$url/releases/download/v$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('3de3a635120249bfba623868bd2c80f037c2c8c1b37a222abed44525ec214c27')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
