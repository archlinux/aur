pkgname=h5v-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.11.0/h5v-x86_64-unknown-linux-gnu-v0.11.0.tar.gz")
sha256sums=('7710b60817cc30ec6e36715b3d9ce4c51eee758e7600ad7f1b22f6938a5c4e35')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
