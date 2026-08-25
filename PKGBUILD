# Maintainer: tranquil-tr0 <tranquil-tr0@proton.me>

pkgname=pkglog-elixir-bin
_pkgname=pkglog
pkgver=1.1
pkgrel=1
pkgdesc="Reports log of package updates"
arch=("x86_64")
url="https://github.com/tranquil-tr0/pkglog-elixir"
license=("AGPL-3.0")
depends=("erlang-core")
conflicts=("pkglog")
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/pkglog")
sha256sums=('10f99c75fed526b22b1419e62c02acae18522607777ce25b508888b269b53c0a')

package() {
  install -D -m755 "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/bin/$_pkgname"
}
