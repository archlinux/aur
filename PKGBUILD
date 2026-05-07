pkgname=h5v-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.7.1/h5v-x86_64-unknown-linux-gnu-v0.7.1.tar.gz")
sha256sums=('73c9e7be0d6e8d078b9a0cd1c9d76dade1005ff0d19282b7bdd4ead92cbb6a47')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
