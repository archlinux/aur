pkgname=ammonite
pkgver=0.7.6
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.8
depends=("scala>=${_scalaver}")
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${pkgver}")
noextract=("ammonite-repl-${pkgver}")
sha256sums=('2e048f5bceaa56ad0ce8c5af32b12761d6a64669b7aafb59cdc4bb4c18b02a16')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}" "${pkgdir}/usr/bin/amm"
}

