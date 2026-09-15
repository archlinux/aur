pkgname=fenriz-bar-bin
pkgver=0.1.16
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
            'upower: battery')
provides=('fenriz-bar')
conflicts=('fenriz-bar' 'fenriz-bar-git')
source=("${url}/releases/download/v${pkgver}/fenriz-bar-${pkgver}.tar.gz")
sha256sums=('5e56070270f051b866877e9d15b5ed2c5fefcb8c11af3f90d1d0901552d7c627')

package() {
    cd "fenriz-bar-${pkgver}"

    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
