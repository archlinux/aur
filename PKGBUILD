# Maintainer: Olivier Churlaud <olivier@churlaud.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=grub2-theme-archlinux
_pkgname=Archlinux
_reponame=grub2-themes-archlinux
pkgver=1.0
pkgrel=5
pkgdesc="Grub2 gfxmenu theme."
url="https://github.com/ochurlaud/grub2-themes-archlinux"
arch=('any')
license=('GPL3')
depends=('grub')
install=${pkgname}.install
source=("https://github.com/ochurlaud/grub2-themes-archlinux/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('aceac0d65eefc3aa7bcb6a8494eb69db')

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  find ${_pkgname} -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
}
