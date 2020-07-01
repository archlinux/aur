# Maintainer: jesuschroist <chris@qlab.pro>

pkgname=ttf-alte-haas-grotesk
pkgver=1.0
pkgrel=2
pkgdesc="A typeface that looks like a helvetica printed in an old Muller-Brockmann book."
arch=('any')
url="http://www.yannlecoroller.com/"
license=('custom')
source=(http://dl.1001fonts.com/alte-haas-grotesk.zip)
md5sums=('9bdbc794a33acd478f2261f112ba971b')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 AlteHaasGroteskRegular.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 AlteHaasGroteskBold.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 Alte\ Haas\ Grotesk\ licence.rtf "$pkgdir/usr/share/licenses/$pkgname/Alte Haas Grotesk licence.rtf"
}
