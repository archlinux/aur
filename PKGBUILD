pkgname=h5v-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.5.2/h5v-x86_64-unknown-linux-gnu-v0.5.2.tar.gz")
sha256sums=('f359450b5b91ba055398bbb0ae6344948c6f713e0046fc06864ff0bc8c77d4af')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
