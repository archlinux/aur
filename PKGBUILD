pkgname=ammonite
pkgver=0.5.2
pkgrel=1
pkgdesc="Ammonite is a cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.7
depends=("scala>=${_scalaver}")
source=("https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('422eac2d06dcefef3c66d6e5c9e0295294be1d5fa214743b42d59d98f766e1b8')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}-${_scalaver}" "${pkgdir}/usr/bin/amm"
}
