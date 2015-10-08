# Maintainer: Gustavo Castro < gustawho [at] gmail [dot] com >

pkgname=grub2-theme-breeze
pkgver=1.0
pkgrel=2
pkgdesc="Grub2 gfxmenu theme."
url="http://opendesktop.org/content/show.php?content=171217"
arch=('any')
license=('CC-SA-BY')
depends=('grub')
install=${pkgname}.install
source=("https://github.com/gustawho/$pkgname/archive/master.zip")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  find . -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
}
