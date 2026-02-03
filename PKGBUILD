# Maintainer: prime-run <prime0run@gmail.com>

pkgname=togo-bin
_pkgname=togo
pkgver=1.1.0
pkgrel=7
pkgdesc="a command line task/todo management utility designed to be simple, fast, and easy to use."
arch=('x86_64')
url="https://github.com/prime-run/togo"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8e07e14340ddd1029004a763d59a0a322502a9e69f5e4f780ba40de350d30e79')

package() {
  cd "$srcdir"

  BINARY="togo-linux-amd64"

  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
