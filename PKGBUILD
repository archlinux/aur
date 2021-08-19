# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=fetch-scm
pkgver=0.1.3
pkgrel=1
pkgdesc='System information fetcher written in GNU Guile Scheme'
arch=('any')
url="https://github.com/KikyTokamuro/fetch.scm"
license=('MIT')
depends=('guile')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c8eeb6618fc144b7e18eccded0df766d5949e09e505cce0930c441f04563821')

package() {
  cd "fetch.scm-$pkgver"
  install -Dm755 "fetch.scm" "$pkgdir/usr/bin/$pkgname"
}
