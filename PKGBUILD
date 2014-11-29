# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fotaq
pkgver=1.1
pkgrel=3
pkgdesc='"Flight of the Amazon Queen" is a graphical point-and-click adventure game'
arch=('any')
url="http://en.wikipedia.org/wiki/Flight_of_the_amazon_queen"
license=('custom')
depends=('scummvm')
source=(http://downloads.sourceforge.net/scummvm/FOTAQ_Talkie-$pkgver.zip
        $pkgname.sh)
md5sums=('4d94f62a907123b77819010117444332'
         'ed893eb708085122f5a77774672f2d99')

package() {
  cd "${srcdir}"

  install -D -m644 "${srcdir}"/queen.1c "${pkgdir}"/usr/share/$pkgname/queen.1c
  install -D -m644 "${srcdir}"/readme.txt "${pkgdir}"/usr/share/licenses/$pkgname/readme.txt
  install -D -m755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
