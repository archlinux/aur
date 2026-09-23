# Maintainer: tranquil-tr0 <tranquil-tr0@proton.me>

pkgname=pkglog-elixir-bin
_pkgname=pkglog
pkgver=2.0.0
pkgrel=1
pkgdesc="Reports log of package updates"
arch=("x86_64")
url="https://github.com/tranquil-tr0/pkglog-elixir"
license=("AGPL-3.0")
depends=("erlang-core")
conflicts=("pkglog")
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/pkglog")
sha256sums=('3fff1fccee668b940dfc5f97a16ab7937800619f69433b2acb72d4605affa679')

package() {
  install -D -m755 "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/bin/$_pkgname"
}
