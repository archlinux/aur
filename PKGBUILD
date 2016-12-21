# Maintainer: Xianwen Chen <xianwen.chen@gmail.com>

pkgname=ttf-traveling-typewriter
pkgver=20060912
pkgrel=1
pkgdesc='Traveling Typewriter is a font made from an old danish "Olympia Traveller de luxe" typewriter, made in western germany, including non-English letters that are desirable for Norwegian, Danish, Swedish, and German.'
arch=('any')
license=('custom:free_for_non_commercial_use')
url="http://www.dafont.com/traveling-typewriter.font"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('wget' 'unzip')
install=$pkgname.install
source=(
  "http://dl.dafont.com/dl/?f=traveling_typewriter"
)

package()
{
  cd "$srcdir/"
  unzip -qo \?f=traveling_typewriter
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.otf $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -d $pkgdir/usr/share/licenses/$pkgname/
}

sha512sums=('1d320e4344f10ef40bc1d3b7ab97fba6c4ee9d0483dba179dc18e724ca28b0a92afd3484d82e488029bb456c720e96bc5d42ff072f0be3a493e2c56044baa8d1')
