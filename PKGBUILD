# Maintainer: 9nunya <9nunya@example.com>
pkgname=rsjfw
pkgver=2.0.0
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer (Binaries)"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine' 'vulkan-icd-loader' 'hicolor-icon-theme' 'glfw' 'libglvnd')
provides=('rsjfw')
conflicts=('rsjfw-git')
install=rsjfw.install
source=("https://github.com/9nunya/RSJFW/releases/download/v${pkgver}/rsjfw-${pkgver}-arch-x86_64.tar.gz"
        "rsjfw.install")
sha256sums=('6f1bb6bde4f4a45e0dc9e08bc8233d379c5a041b708fbb1f09ad45b74e0dd103'
            '87a7cdc5b43b23328285436f72ca7d4fb92268e756f46dc8ec5b02025e0c7c41')

package() {
    install -d "$pkgdir/usr"
    cp -a "$srcdir"/usr/* "$pkgdir/usr/"
}
