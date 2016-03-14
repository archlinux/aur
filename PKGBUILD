# Maintainer: Miloš Polakovič <milos@mailbox.org>

pkgname=ttf-webhostinghub-glyphs
pkgver=1.0
pkgrel=1
pkgdesc='WebHostingHub Glyphs icon font by webhostinghub.com'
arch=('any')
url='http://www.webhostinghub.com/glyphs/'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-webhostinghub-glyphs.install
source=('http://www.webhostinghub.com/glyphs/resources/whhg-font.zip')
md5sums=('09993f3df25fa9edfca8b856b23c1425')

package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/whhg-font/font/*.ttf $pkgdir/usr/share/fonts/TTF/
}
