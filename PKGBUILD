# Maintainer: tranquil-tr0 <tranquil-tr0@proton.me>

pkgname=pkglog-elixir-bin
_pkgname=pkglog
pkgver=2.1.0
pkgrel=1
pkgdesc="Reports log of package updates"
arch=("x86_64")
url="https://github.com/tranquil-tr0/pkglog-elixir"
license=("AGPL-3.0")
depends=("erlang-core")
conflicts=("pkglog")
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/pkglog")
sha256sums=('d4b55d9e4eee7ffef3c986a4bb7e25f29e61d44082553a64b7c2b48bc911196e')

package() {
  install -D -m755 "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/bin/$_pkgname"
}
