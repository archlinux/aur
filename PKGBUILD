# Maintainer: George Dietrich <dev@dietrich.pub>
pkgname=oq-bin
pkgver=1.3.5
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq')
conflicts=('oq')
provides=('oq')
source=("oq-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('66b2d879b6e2061121c50b8e584ce82f95fe79348bf3696ca38e5910a6c42495')
source_x86_64=("$url/releases/download/v$pkgver/oq-v$pkgver-linux-$CARCH")
sha256sums_x86_64=('2701992b03e98afa4be452f5c1711850fe9e54812917c62f741ba884f05b6389')

package() {
  install -Dm755 "oq-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/oq"
  install -Dm644 "oq-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
