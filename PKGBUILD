# Maintainer: Parth Nobel <pnob99 *AT* gmail *DOT* com>

pkgname=quintet
pkgver=14.7
pkgrel=1
pkgdesc='A multi-platform Helm Simulator'
arch=('x86_64')
url="http://quintet.us"
license=('custom')
depends=('lib32-glu'
         'lib32-libxcursor')
source=("http://www.quintet.us/files/quintet-linux.zip"
        'quintet')
sha256sums=('4fba003c04ab7cbf1688a5b71e230db1402b00346dc02a458b62e5910da272fe'
            '2fbadcb58ef9f687fa6d3eb080316699819a843700e4a757938711f83d620bd6')

package() {
  install -d "$pkgdir"/usr/lib32/quintet
  cp -R "$srcdir"/linux/* "$pkgdir"/usr/lib32/quintet
  install -D -m 0755 "$srcdir"/quintet "$pkgdir"/usr/bin/quintet
}

