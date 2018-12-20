# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=ddcci-driver-linux-dkms
pkgver=0.3.2
pkgrel=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=("https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz")
md5sums=('2592ba497fa11fbbb0e8cf0b7a35fdc4')

package() {
  cd "ddcci-driver-linux-v${pkgver}"

  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rt     "${destdir}" .
}
