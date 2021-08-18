# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.1
pkgrel=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=("https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz")
md5sums=('faba73b3362192d31c0a5c40f45990a7')

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
