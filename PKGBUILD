# Maintainer: 9nunya <9nunya@example.com>
pkgname=rsjfw
pkgver=1.0.5 # PLACEHOLDER_VERSION
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
sha256sums=('81b5dee9229d31e10d60ee87c81e71ccd5709495a07111ae4c85a8ce8ab761e9' 'SKIP') # PLACEHOLDER_SHA256

package() {
    install -d "$pkgdir/usr"
    cp -a "$srcdir"/usr/* "$pkgdir/usr/"
}
