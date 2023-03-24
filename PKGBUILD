# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=fetch-scm
pkgver=0.1.6
pkgrel=1
pkgdesc='System information fetcher written in GNU Guile Scheme'
arch=('any')
url="https://github.com/KikyTokamuro/fetch.scm"
license=('MIT')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3c87529e98b58162145b3d37a1b981b6440d0fff20a5324e1a1bbe1e31d14724')

package() {
  cd "fetch.scm-$pkgver"
  install -Dm755 "fetch.scm" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
