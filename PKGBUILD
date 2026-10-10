# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=ttf-libron
pkgver=0.31
pkgrel=1
pkgdesc="Serif typeface tuned for digital reading and e-readers (Readerly fork)"
arch=('any')
url="https://github.com/nicoverbruggen/libron"
license=('OFL-1.1')
depends=()
source=("ttf-libron-$pkgver.zip::https://github.com/nicoverbruggen/libron/releases/download/v$pkgver/Libron.zip"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/nicoverbruggen/libron/v$pkgver/LICENSE"
  "COPYRIGHT-$pkgver::https://raw.githubusercontent.com/nicoverbruggen/libron/v$pkgver/COPYRIGHT")
sha256sums=('ce9a355b46b11c2cbe158e9149ee13a3fa813ca28661d878723d72f477324033'
            'bc596e272be47691f70c090bca17a8b6e58bd021baada8be18510beceed6cfbd'
            'd14a8638c40c1e1a02458b9f46860030b88cc27ac1cae65f18aa943b69495718')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir"/Libron-*.ttf

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "COPYRIGHT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
