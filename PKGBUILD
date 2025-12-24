# Maintainer: 9nunya <9nunya@example.com>
pkgname=rsjfw
pkgver=1.0.7 # PLACEHOLDER_VERSION
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer (Binaries)"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine' 'vulkan-icd-loader' 'hicolor-icon-theme')
provides=('rsjfw')
conflicts=('rsjfw-git')
source=("https://github.com/9nunya/RSJFW/releases/download/v${pkgver}/rsjfw-${pkgver}-x86_64.tar.gz")
sha256sums=('dd2700bb9ad4b179297ad483da8cb47437b653193c6d57e3e37d39cf609cbe75') # PLACEHOLDER_SHA256

package() {
    # The binary release contains the full /usr structure
    install -d "$pkgdir/usr"
    cp -a "$srcdir"/usr/* "$pkgdir/usr/"
}
