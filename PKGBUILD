pkgname=fenriz-bar-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="Status bar for Wayland compositors (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'json-glib' 'wayland' 'wireplumber' 'libnm')
optdepends=('fenriz: the compositor this bar is built for'
            'fenriz-desktop: shared config and theme'
            'networkmanager: wifi'
            'bluez: bluetooth'
            'upower: battery'
            'wf-recorder: screen recording')
provides=('fenriz-bar')
conflicts=('fenriz-bar' 'fenriz-bar-git')
source=("${url}/releases/download/v${pkgver}/fenriz-bar-${pkgver}.tar.gz")
sha256sums=('16fda2c5358070efe3fecf6d804404d61a0c4b1fbe5083fca1cefd6f096ee3c8')

package() {
    cd "fenriz-bar-${pkgver}"

    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
