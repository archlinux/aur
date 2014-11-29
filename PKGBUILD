# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=draci-historie-dubbing-cz
pkgver=1.0
pkgrel=2
pkgdesc="Czech voices for the first Czech CD-ROM-based 2D point-and-click adventure game"
arch=('any')
url="http://www.ucw.cz/draci-historie/index-en.html"
license=('GPL2')
depends=('scummvm')
source=(http://www.ucw.cz/draci-historie/binary/old/dubbing-cz-orig.zip)
md5sums=('bb5e16c921ab1dba4a6ac87d28224f47')

package() {
  cd "${srcdir}"

  install -D -m644 "${srcdir}"/CD.SAM "${pkgdir}"/usr/share/dragon_history/CD.SAM
}
