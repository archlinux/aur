# Maintainer: Sebastien MacDougall-Landry

pkgname=jsmn
pkgver=1.1.0
pkgrel=1
pkgdesc='JSON parser/tokenizer'
url='https://github.com/zserge/jsmn'
source=("https://github.com/zserge/$pkgname/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38')

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 jsmn.h -t "$pkgdir/usr/include/"
}

