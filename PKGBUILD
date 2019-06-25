# Maintainer: Miloš Polakovič <milos@mailbox.org>

pkgname=ttf-webhostinghub-glyphs
pkgver=1.0
pkgrel=4
pkgdesc='WebHostingHub Glyphs icon font by webhostinghub.com'
arch=('any')
url='https://www.webhostinghub.com/glyphs/'
license=('OFL')
depends=('fontconfig')
makedepends=('fontforge')
source=('https://www.webhostinghub.com/glyphs/resources/whhg-font.zip')
md5sums=('09993f3df25fa9edfca8b856b23c1425')

package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/whhg-font/font/webhostinghub-glyphs.ttf $pkgdir/usr/share/fonts/TTF/
}
