pkgname=h5v-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.5.1/h5v-x86_64-unknown-linux-gnu-v0.5.1.tar.gz")
sha256sums=('14d3da0f4220d4f8339ce075606549c741924987ffaae0ea692f3b1746e28144')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
