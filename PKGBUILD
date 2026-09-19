pkgname=fenriz-bar-bin
pkgver=0.1.17
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
sha256sums=('fc511032b70da6c1f8116ae7022f3d1d8b433f003a48f3f88f52773429e17de3')

package() {
    cd "fenriz-bar-${pkgver}"

    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
