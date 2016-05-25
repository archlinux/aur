pkgname=ammonite
pkgver=0.5.8
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.8
depends=("scala>=${_scalaver}")
source=("https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/ammonite-repl-${pkgver}-${_scalaver}")
sha256sums=('1bcaf9eee84d662f8c24396b9b8fa117afc7933c1c8c74d7650b3f358b77ee5b')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}-${_scalaver}" "${pkgdir}/usr/bin/amm"
}

