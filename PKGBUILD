# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ttf-klingon-piqad-vahbo
epoch=3
pkgver=20150223
pkgrel=1
pkgdesc="Klingon pIqaD vaHbo' font."
arch=('any')
license=('custom')
url="http://www.evertype.com/fonts/tlh/"
depends=('p7zip' 'fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(
  "vahbo.zip::http://www.evertype.com/fonts/tlh/klingon-piqad-vahbo'.zip"
)
noextract=('vahbo.zip')

prepare()
{
    cd $srcdir
    7z e vahbo.zip
}

package()
{
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF/ 
}

sha384sums=('2f6306385dcc96cfe11f21ba6fb11ba6a18c32036584daa534d040f5e2fefd25efe8ae758ed166c05fc2b8d81b2f4b83')

