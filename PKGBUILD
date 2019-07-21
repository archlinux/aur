# Maintainer: Ivan Sosnov < ivanmsosnov at gmail dot com >

pkgname=gnome-shell-extension-dynamic-panel-transparency
pkgver=25
pkgrel=1
pkgdesc='Extension for GNOME shell, that allows to enable dynamic transparency for various shell elements'
arch=(any)
url="https://github.com/rockon999/dynamic-panel-transparency"
license=(GPL2)
makedepends=()
source=("https://github.com/rockon999/dynamic-panel-transparency/archive/v${pkgver}.tar.gz")
sha256sums=('667317443dc0c5924ef9327d885983f87f826dbc9b7e21f2dd973f91b4edac8f')

package() {
    depends=('gnome-shell')
    echo "${srcdir}"
    cd "${srcdir}/dynamic-panel-transparency-${pkgver}"
    rm -r ~/.local/share/gnome-shell/extensions
    mv dynamic-panel-transparency@rockon999.github.io ~/.local/share/gnome-shell/extensions
}