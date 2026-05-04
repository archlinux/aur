pkgname=h5v-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.4.4/h5v-x86_64-unknown-linux-gnu-v0.4.4.tar.gz")
sha256sums=('61e572c9afe2d67125c59099c9bb51ad97348f431ed18c24a28cfd30994b95ae')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
