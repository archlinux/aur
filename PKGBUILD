pkgname=h5v-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.5.0/h5v-x86_64-unknown-linux-gnu-v0.5.0.tar.gz")
sha256sums=('c12ba33cc4b35a7ec314fc394a02df4bdcae27e6e1f9704e9a12aa470d6f63a5')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
