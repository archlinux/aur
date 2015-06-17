# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=grub2-theme-archlinux
_pkgname=Archlinux
pkgver=1.0
pkgrel=4
pkgdesc="Grub2 gfxmenu theme."
url="https://github.com/Generator/Grub2-themes"
arch=('any')
license=('GPLv3')
depends=('grub')
install=${pkgname}.install
source=("https://github.com/downloads/Generator/Grub2-themes/$_pkgname-$pkgver.tar.bz2")
md5sums=('d6ec2d58685eb3b92d96d2ac9a09b0d7')

package() {
  cd "${srcdir}"
  find . -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
}
