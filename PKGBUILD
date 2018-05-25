# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mozart2-bin
pkgver=2.0.0_alpha.0
pkgrel=1
pkgdesc='Runtime and development environment of Oz'
arch=('x86_64')
url='https://mozart.github.io/'
license=('BSD')
depends=('tk' 'emacs')
conflicts=('mozart2' 'mozart2-compiler')
source=("$pkgname-$pkgver.rpm::https://sourceforge.net/projects/mozart-oz/files/v2.0.0-alpha.0/mozart2-${pkgver/_/-}+build.4140.005f700-$CARCH-fc22.rpm/download"
        "https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt")
md5sums=('33ce35da79de268ad987b4150d0eb82a'
         '761f3c1b5b9987bc87abc4ca8e6440fa')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cp -R usr $pkgdir
}
