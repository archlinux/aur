# Maintainer: Your Name <micro.fedora@gmail.com>
pkgname=mssl1680-firmware
pkgver=0.1
pkgrel=1
pkgdesc="firmware for silead mssl1680 touchscreen with the newest silead_ts driver"
arch=('any')
url=""
license=('GPL')
depends=('linux>=4.9.0')
makedepends=('git')
source=("git+https://github.com/edward-p/mssl1680-firmware.git")
md5sums=('SKIP')

build() {
  return 0
}

package() {
  cd $pkgname
  if ! [ -a ${pkgdir}/usr/lib/firmware/silead ];
    then
    mkdir -p ${pkgdir}/usr/lib/firmware/silead
  fi
  cp mssl1680.fw ${pkgdir}/usr/lib/firmware/silead
  return 0
}
