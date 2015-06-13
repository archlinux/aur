# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=ttf-tengwar-annatar
pkgver=1.20
pkgrel=1
pkgdesc="The Tengwar Annatar ttf font family. (Tolkein Elvish)"
arch=(any)
#url="http://home.student.uu.se/j/jowi4905/fonts/annatar.html"
url="http://tengwar.art.pl/tengwar/fonty.php"
license=('custom: tengwar-annatar')
depends=(fontconfig xorg-font-utils)
install=ttf.install
#source=('http://home.student.uu.se/j/jowi4905/fonts/tngan120.zip'
source=('http://tengwar.art.pl/tengwar/zip/tngan120.zip'
        'COPYING')

md5sums=('8833d945ed5e512f136d27fad6c985d5'
         'aaf041d42dd102899bf03407fd1dc8a0')

package() {
  cd "$srcdir"
  
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/ttf-tengwar-annatar/license"

  install -Dm644 readme.txt "$pkgdir/usr/share/tengwar-annatar/README"
  install -Dm644 tngandoc.pdf "$pkgdir/usr/share/tengwar-annatar/README.pdf"

}

# vim:set ts=2 sw=2 et:
