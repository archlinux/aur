pkgname=ammonite
pkgver=0.5.3
pkgrel=1
pkgdesc="Ammonite is a cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.7
depends=("scala>=${_scalaver}")
source=("https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('f4548bfea36d8e58d91e70681aa2bd47a89bfe4e7ff56fa3db848ba197239263')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}-${_scalaver}" "${pkgdir}/usr/bin/amm"
}

