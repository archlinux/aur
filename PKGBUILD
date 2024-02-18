# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=pcf-unifont
pkgver=15.1.04
pkgrel=2
pkgdesc="GNU Unifont Glyphs (PCF version)"
arch=('any')
url="https://unifoundry.com/unifont/index.html"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.pcf.gz"{,.sig}
        "https://unifoundry.com/LICENSE.txt")
sha256sums=('5c728ff31c7e1af8456015b4dd26a66e977681c94abd0533d490232256f9f4e2'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

package() {
  cd "$srcdir"
  install -Dm644 "unifont-$pkgver.pcf.gz" "$pkgdir/usr/share/fonts/misc/unifont.pcf.gz"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
