# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=fetch-scm
pkgver=0.1.5
pkgrel=1
pkgdesc='System information fetcher written in GNU Guile Scheme'
arch=('any')
url="https://github.com/KikyTokamuro/fetch.scm"
license=('MIT')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('02125f15313ca33b9def32406aab61dc823b06ae866edd8fabcb7e4eb3210da3')

package() {
  cd "fetch.scm-$pkgver"
  install -Dm755 "fetch.scm" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
