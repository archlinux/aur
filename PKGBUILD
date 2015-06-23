# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ttf-klingon-piqad-mandel
epoch=3
pkgver=20150223
pkgrel=1
pkgdesc="Klingon pIqaD Mandel font."
arch=('any')
license=('custom')
url="http://www.evertype.com/fonts/tlh/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(
  "http://www.evertype.com/fonts/tlh/klingon-piqad-mandel.zip"
)
package()
{
  cd $srcdir/klingon-piqad-mandel-203/

  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 $srcdir/klingon-piqad-mandel-203/*.ttf $pkgdir/usr/share/fonts/TTF/ 
}

sha384sums=('076413a87a5b57c93bfe0e53775eba8c980de5823c57b0688a2554c17762f60746938e57adfbfd9276c8863a61cecedc')
