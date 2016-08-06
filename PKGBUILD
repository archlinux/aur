pkgname=ammonite
pkgver=0.7.0
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.8
depends=("scala>=${_scalaver}")
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${pkgver}")
noextract=("ammonite-repl-${pkgver}")
sha256sums=('bcd86bee82b63f11bd4ae8b3c72b90401f3183b09f586326aeb6743f4c78f918')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}" "${pkgdir}/usr/bin/amm"
}

