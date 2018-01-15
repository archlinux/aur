
# Maintainer: LightDot <lightdot -a-t- g m a i l>
pkgname=ttf-nokiapure
pkgver=1.0
pkgrel=2
pkgdesc="Nokia Pure text font"
arch=('any')
url="https://en.wikipedia.org/wiki/Nokia_Pure"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=("http://web.archive.org/web/20141118200943/https://assetportal.nokia.com/other_files/Brand_Book_v2.2_2011/Fonts/puretext/nokiapuretext-webfont.ttf")
install=$pkgname.install
md5sums=('d1d5f51179052d6104884eb37590cae8')

package() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
