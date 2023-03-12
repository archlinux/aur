# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
_pkgname=igdm
pkgver=3.0.4
pkgrel=1
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64')
url="https://github.com/igdmapps/igdm"
license=('MIT')
depends=(at-spi2-core nss gtk3 alsa-lib)
provides=('igdmapps')
conflicts=('igdm')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb")
sha256sums=('c65181d96bc3886b77e37fe76d4a17626399ed3253a6353b78759fe0a1e40d99')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}