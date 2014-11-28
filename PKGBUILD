# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=draci-historie-dubbing-cz
pkgver=1.0
pkgrel=1
pkgdesc="Czech voices for the first Czech CD-ROM-based 2D point-and-click adventure game"
arch=('any')
url="http://www.ucw.cz/draci-historie/index-en.html"
license=('GPL2')
depends=('scummvm')
source=(http://www.ucw.cz/draci-historie/binary/dubbing.zip)
md5sums=('bb5e16c921ab1dba4a6ac87d28224f47')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/dragon_history
  install -D -m644 ${srcdir}/* ${pkgdir}/usr/share/dragon_history

  rm ${pkgdir}/usr/share/dragon_history/dubbing.zip
}
