# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=disk-image-scripts
pkgver=1.1
pkgrel=1
pkgdesc="Scripts for manipulating raw images of disks as files"
arch=('any')
url="https://github.com/GIJack/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'parted' 'qemu')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('6400be98b6837c514a29e3396a0ca30da8460237f241b5c75a3bed8b5833ab11')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
