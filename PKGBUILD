# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=draci-historie-pl
pkgver=1.0
pkgrel=2
pkgdesc="The first Czech CD-ROM-based 2D point-and-click adventure game - polish version"
arch=('any')
url="http://www.ucw.cz/draci-historie/index-en.html"
license=('GPL2')
depends=('scummvm')
optdepends=('draci-historie-dubbing-cz: czech dubbing files for the game')
conflicts=('draci-historie-en' 'draci-historie-cz')
install=$pkgname.install
source=(http://www.ucw.cz/draci-historie/binary/dh-pl.zip)
md5sums=('5ffe3b709050b5f2c85aef5ea87e7591')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/dragon_history
  install -D -m644 ${srcdir}/* ${pkgdir}/usr/share/dragon_history

  rm ${pkgdir}/usr/share/dragon_history/dh-pl.zip
}
