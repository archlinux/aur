# Maintainer: prime-run <prime0run@gmail.com>

pkgname=togo-bin
_pkgname=togo
pkgver=1.0.5
pkgrel=6
pkgdesc="a command line task/todo management utility designed to be simple, fast, and easy to use."
arch=('x86_64')
url="https://github.com/prime-run/togo"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b757f83d7463dc3e61e281e555d5b34d010854465b6f9d5007cfe7d871f9b4ef')

package() {
  cd "$srcdir"

  BINARY="togo-${pkgver}-linux-amd64"

  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
