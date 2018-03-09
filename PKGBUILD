# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor:  Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributer: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=grub2-theme-arch-suse
pkgver=3.1
pkgrel=1
pkgdesc="ArchLinux branded Grub2 theme adapted from openSUSE 12.2"
url="http://www.opensuse.org/en/"
arch=('any')
license=('GPL')
depends=('grub')
install='grub2-theme-arch-suse.install'

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/nullptrT/grub2-theme-arch-suse/archive/v${pkgver}.tar.gz"
        "grub2-theme-arch-suse.install")

md5sums=('6eb7ef1040a93b4f81c884707afc9d8a'
         '4173c0f06dc634a9e1b78f2260a8d8e0')

package() {
  cd $srcdir
  install -Dm755 -d ${pkgdir}/boot/grub/themes/arch-suse
  cp -rf ${srcdir}/${pkgname}-${pkgver}/theme/ ${pkgdir}/boot/grub/themes/arch-suse/
  cp ${srcdir}/${pkgname}-${pkgver}/TRADEMARKS ${pkgdir}/boot/grub/themes/arch-suse/
}

