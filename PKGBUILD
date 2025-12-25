# Maintainer: 9nunya <9nunya@example.com>
pkgname=rsjfw
pkgver=1.0.4 # PLACEHOLDER_VERSION
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer (Binaries)"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine' 'vulkan-icd-loader' 'hicolor-icon-theme' 'glfw' 'libglvnd')
provides=('rsjfw')
conflicts=('rsjfw-git')
install=rsjfw.install
source=("https://github.com/9nunya/RSJFW/releases/download/v${pkgver}/rsjfw-${pkgver}-x86_64.tar.gz"
        "rsjfw.install")
sha256sums=('413f1e30011a2a3e4b8b68bebcb9f32101bf834450b20e43a9a93df462d6428c' 'SKIP') # PLACEHOLDER_SHA256

package() {
    install -d "$pkgdir/usr"
    cp -a "$srcdir"/usr/* "$pkgdir/usr/"
}
