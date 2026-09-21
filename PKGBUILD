pkgname=fenriz-bar-bin
pkgver=0.1.18
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
sha256sums=('d4f45dd3f8f1712b073d494f6a3ec0db8df26598462713d58a6d7cf6e559f989')

package() {
    cd "fenriz-bar-${pkgver}"

    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
