# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ttf-klingon-piqad-hasta
epoch=3
pkgver=20150223
pkgrel=1
pkgdesc="Klingon pIqaD HaSta font."
arch=('any')
license=('custom')
url="http://www.evertype.com/fonts/tlh/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(
  "http://www.evertype.com/fonts/tlh/klingon-piqad-hasta.zip"
)
package()
{
  cd $srcdir/klingon-piqad-hasta-203/

  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 $srcdir/klingon-piqad-hasta-203/*.ttf $pkgdir/usr/share/fonts/TTF/ 
}

sha384sums=('4e2c870982affcbe903d62700a2d6602e205f83cf391e0d19a4d87442cfcd5ed410e6e0d8a9228e1ae45eafee0e914b4')
