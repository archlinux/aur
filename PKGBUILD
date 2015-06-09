# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-nokiapure
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Nokia Pure text font"
arch=('any')
source=(http://brandbook.nokia.com/other_files/Brand_Book_v2.2_2011/Fonts/puretext/nokiapuretext-webfont.ttf)
install=$pkgname.install
md5sums=('d1d5f51179052d6104884eb37590cae8')
url="http://brandbook.nokia.com/"
license=('unknown')

package() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

