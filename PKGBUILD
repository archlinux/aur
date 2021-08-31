# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=fetch-scm
pkgver=0.1.4
pkgrel=1
pkgdesc='System information fetcher written in GNU Guile Scheme'
arch=('any')
url="https://github.com/KikyTokamuro/fetch.scm"
license=('MIT')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9379d17badf0d01207880a5cb3af84dbe00b05e524aefc6fdec3734f3185fb53')

package() {
  cd "fetch.scm-$pkgver"
  install -Dm755 "fetch.scm" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
