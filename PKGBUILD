pkgname=ammonite
pkgver=0.9.0
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.12
depends=("scala>=${_scalaver}")
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${_scalaver}-${pkgver}"
        'https://github.com/lihaoyi/Ammonite/raw/master/LICENSE')
noextract=("ammonite-repl-${pkgver}")
sha256sums=('5345443e9f90e3cad5c5d5acc51814e0540921504a03ea6a52752d7883d4758a'
            '90320c4bcccf8df57cc5d6f7b0b1778231ae87c64fe5405bae45af4ff9f87e8e')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}" "${pkgdir}/usr/bin/amm"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

