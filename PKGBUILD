pkgname=ammonite
pkgver=0.4.5
pkgrel=1
pkgdesc="Ammonite is a cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('Unkown')
_scalaver=2.11.7
depends=("scala>=${_scalaver}")
source=("https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('bea342daf593f50d9e9322af3257778cc9a63ee0851a834c16bffb4ac1d5c435')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}-${_scalaver}" "${pkgdir}/usr/bin/amm"
}
