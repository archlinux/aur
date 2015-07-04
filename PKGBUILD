# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=ttf-dosega
pkgver=20100605
pkgrel=1
pkgdesc='An exact copy of the DOS EGA font, by Mateusz Viste'
arch=('any')
license=('CC-BY-SA')
url='http://www.viste-family.net/mateusz/dos/en/dosega.htm'
depends=('xorg-font-utils' 'fontconfig')
install='ttf-dosega.install'
source=("http://www.viste-family.net/mateusz/dos/dosega.zip")
md5sums=('f15bcb0a9d2479b629427ec573eb3b29')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/fonts/TTF/
  install -m644 DOSEGA.ttf "$pkgdir"/usr/share/fonts/TTF/
}
