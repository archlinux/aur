# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=disk-image-scripts
pkgver=1.0
pkgrel=1
pkgdesc="Scripts for manipulating raw images of disks as files"
arch=('any')
url="https://github.com/GIJack/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'parted' 'qemu')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('8624a59b079e32e3b6b2e2a6c985abdce760d59fdc2e93e127f87763e83d7eca')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
