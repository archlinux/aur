# Maintainer: Sebastien MacDougall-Landry

pkgname=zpl
pkgver=19.4.0
pkgrel=1
pkgdesc='C99 header-only library oriented towards improving the coding experience.'
url='https://github.com/zpl-c/zpl'
source=("$url/releases/download/19.4.0/zpl.h")
arch=('any')
license=('Unlicense')
sha256sums=('8ed08921e21a8f90d4bb1a47daea736eff326cd7160e7df4f1bba1bb60ee455e')

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 zpl.h -t "$pkgdir/usr/include/"
}

