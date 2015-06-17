# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=grub2-theme-archxion
_pkgname=Archxion
pkgver=1.0
pkgrel=6
pkgdesc="Grub2 gfxmenu theme."
url="https://github.com/Generator/Grub2-themes"
arch=('any')
license=('GPLv3')
depends=('grub')
install=${pkgname}.install
source=("https://github.com/downloads/Generator/Grub2-themes/$_pkgname.tar.bz2")
md5sums=('b994445c08e81c00d91c727e06053f44')

package() {
  cd "${srcdir}"
  rm ${srcdir}/Archxion/progress_highlight_{e,w}.png
  find . -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
}
