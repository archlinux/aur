# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=disk-image-scripts
pkgver=1.2
pkgrel=1
pkgdesc="Scripts for manipulating raw images of disks as files"
arch=('any')
url="https://github.com/GIJack/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'qemu')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('398f62bcf4302fefbbc58f958d3b8e4d1c79de5d6fd195aa9da8c9fc4eca0b9d')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
