# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=draci-historie-en
pkgver=1.0
pkgrel=2
pkgdesc="The first Czech CD-ROM-based 2D point-and-click adventure game - english version"
arch=('any')
url="http://www.ucw.cz/draci-historie/index-en.html"
license=('GPL2')
depends=('scummvm')
optdepends=('draci-historie-dubbing-cz: czech dubbing files for the game')
conflicts=('draci-historie-cz' 'draci-historie-pl')
install=$pkgname.install
source=(http://www.ucw.cz/draci-historie/binary/dh-en.zip)
md5sums=('b43a31c486e3b29fb05130a8eef65531')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/dragon_history
  install -D -m644 ${srcdir}/* ${pkgdir}/usr/share/dragon_history

  rm ${pkgdir}/usr/share/dragon_history/dh-en.zip
}
