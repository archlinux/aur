# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq')
conflicts=('oq')
provides=('oq')
source=("oq-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('a926c362a1c1aa3c50b5871b93a387f59166053f3ab611a373a9e9e44300be7f')
source_x86_64=("$url/releases/download/v$pkgver/oq-v$pkgver-linux-$CARCH")
sha256sums_x86_64=('db82858ac047cbf0aea4d2cd07edd49e697c6b19b78ffc3456df5e827c117c47')

package() {
  install -Dm755 "oq-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/oq"
  install -Dm644 "oq-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
