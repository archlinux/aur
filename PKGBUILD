# Maintainer: Ilya Chelyadin <ilya77105@gmail.com>

pkgname=ddcci-driver-linux-0.5.0-dkms
pkgver=0.5.0
pkgrel=1
pkgdesc='Linux kernel drivers for DDC/CI monitors (DKMS), 0.5.0 fork'
arch=('i686' 'x86_64' 'aarch64')
url='https://gitlab.com/kokokoshka/ddcci-driver-linux/'
license=('GPL-2.0-or-later')
depends=('dkms')
conflicts=(
  'ddcci-driver-linux'
  'ddcci-driver-linux-dkms'
  'ddcci-driver-linux-dkms-git'
  'ddcci-driver-linux-clemax-dkms-git'
)
source=("https://gitlab.com/kokokoshka/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz")
b2sums=('adf1edf1c1513404e56d31b559fb69eadac0282b6168e221857fb4cfa91f6e90e3ddbb22d39dc2728de38869ee5d641938e8c306cf15b96448370f726a50ec37')

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
