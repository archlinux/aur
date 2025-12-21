# Maintainer: 9nunya <9nunya@example.com>
pkgname=rsjfw
pkgver=1.0.5 # PLACEHOLDER_VERSION
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer (Binaries)"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine' 'vulkan-icd-loader' 'hicolor-icon-theme')
provides=('rsjfw')
conflicts=('rsjfw-git')
source=("https://github.com/9nunya/RSJFW/releases/download/v${pkgver}/rsjfw-${pkgver}-x86_64.tar.gz")
sha256sums=('29fc4bec2d33bb16727f0bd720f34d55eb28e354d868415e9624d97c44466a4a') # PLACEHOLDER_SHA256

package() {
    # The binary release contains the full /usr structure
    install -d "$pkgdir/usr"
    cp -a "$srcdir"/usr/* "$pkgdir/usr/"
}
