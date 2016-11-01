# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=ttf-dosega
pkgver=20150901
pkgrel=1
pkgdesc='An exact copy of the DOS EGA font, by Mateusz Viste'
arch=('any')
license=('CC-BY-SA')
url='http://dosega.sourceforge.net'
depends=('xorg-font-utils' 'fontconfig')
install='ttf-dosega.install'
source=("http://downloads.sourceforge.net/dosega/DOSEGA-$pkgver.zip")
md5sums=('f4311c29c7060bc39ac2d9dfcc04910e')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/fonts/TTF/
  install -m644 DOSEGA.ttf "$pkgdir"/usr/share/fonts/TTF/
}
