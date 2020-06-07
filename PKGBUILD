# Maintainer: oldherl <oldherl@gmail.com>

pkgname=ttf-senty-free
pkgver=20200607.39
pkgrel=1
pkgdesc="Senty Chinese handwritten font collection from Hanyi."
arch=('any')
url="https://www.sentyfont.com/"
license=('custom:"Free for non-commercial use."')
source=(
'https://www.sentyfont.com/index_htm_files/All-39-HanyiSentyFonts.zip'
)
sha256sums=('eaeff188d0ad41906734bc0990791590a8ae6d6c7108772b533216cfaac9cea3')

package()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF/senty/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/senty/
}
