pkgname=h5v-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Terminal HDF5 viewer with matrix/chart/image previews"
arch=('x86_64')
url="https://github.com/DanielHauge/h5v"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('wl-clipboard: Wayland clipboard integration' 'xclip: X11 clipboard helper')
source=("h5v-${pkgver}.tar.gz::https://github.com/DanielHauge/h5v/releases/download/v0.15.0/h5v-x86_64-unknown-linux-gnu-v0.15.0.tar.gz")
sha256sums=('8fab485119906c965e7050fc4158c8e387e9d206652cb3d1ba7e67f6a845d0fd')

package() {
  install -Dm755             "${srcdir}/h5v-x86_64-unknown-linux-gnu-v${pkgver}/h5v"             "${pkgdir}/usr/bin/h5v"
}
