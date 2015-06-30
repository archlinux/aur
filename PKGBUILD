# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: Matthew Longley <randomticktock@gmail.com>

pkgname=ttf-mona
pkgver=2.90
pkgrel=1
pkgdesc="A Japanese proportional font which allows you to view Japanese text arts correctly."
arch=('i686' 'x86_64')
license=('custom')
url="http://monafont.sourceforge.net/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=(http://downloads.sourceforge.net/monafont/monafont-ttf-${pkgver}.zip license.txt)
md5sums=('fa952f01f0187664aaca5d3e259197d3'
         'b98e405f9b27aba83c32ff42a2fdf3e4')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 mona.ttf $pkgdir/usr/share/fonts/TTF/
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 license.txt $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt
}
