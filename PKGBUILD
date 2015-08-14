pkgname=ammonite
pkgver=0.4.4
pkgrel=1
pkgdesc="Ammonite is a cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('Unkown')
_scalaver=2.11.7
depends=("scala>=${_scalaver}")
source=("https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('5bedc2ec3e263f6608e1bc719aef2023302bc4af6d220839b13c55b9dc44f746')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}-${_scalaver}" "${pkgdir}/usr/bin/amm"
}
