pkgname=fenriz-bar-bin
pkgver=0.1.19
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
sha256sums=('548ae78b62897b5631d01259b07a62a9be3e781f150a25d8198959a904c3c563')

package() {
    cd "fenriz-bar-${pkgver}"

    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
