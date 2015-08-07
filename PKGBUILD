pkgname=ammonite
pkgver=0.4.3
pkgrel=1
pkgdesc="Ammonite is a cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('Unkown')
_scalaver=2.11.7
depends=("scala>=${_scalaver}")
source=("amm"::"https://github.com/lihaoyi/Ammonite/releases/download/0.4.3/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('6a0953401ffed56d8abb0c1c4339a842bf515c1007cd7f25c538faf7c8e617ec')
install="${pkgname}.install"

package() {
    install -Dm755 amm "${pkgdir}/usr/bin/amm"
}
