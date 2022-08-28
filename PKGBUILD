# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq-bin
pkgver=1.3.4
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq')
conflicts=('oq')
provides=('oq')
source=("oq-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e99c9ba292c466ca39fb7f6d0053f9fe13c2768a7493d1ef88ea2ca2e0d0ca0')
source_x86_64=("$url/releases/download/v$pkgver/oq-v$pkgver-linux-$CARCH")
sha256sums_x86_64=('d33f6de1a77713b46081e79dbc3664f8386dae0454fc0545934d07153cadc90e')

package() {
  install -Dm755 "oq-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/oq"
  install -Dm644 "oq-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
