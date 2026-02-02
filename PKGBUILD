# Maintainer: tranquil-tr0 <tranquil-tr0@proton.me>

pkgname=pkglog-elixir-bin
_pkgname=pkglog
pkgver=1.0
pkgrel=1
pkgdesc="Reports log of package updates"
arch=("x86_64")
url="https://github.com/tranquil-tr0/pkglog-elixir"
license=("AGPL-3.0")
depends=("erlang-core")
conflicts=("pkglog")
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/pkglog")
sha256sums=('e0080bf597a83e465907d03f93efec32248a9c95296a7c8d9df33cd7417b1033')

package() {
  install -D -m755 "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/bin/$_pkgname"
}
