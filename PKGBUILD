# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=disk-image-scripts
pkgver=1.1.1
pkgrel=1
pkgdesc="Scripts for manipulating raw images of disks as files"
arch=('any')
url="https://github.com/GIJack/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'qemu')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('4333dd36a96996587d2f4c4742af0573619549b0b0eaf3eac3ff479d7a0959fd')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
