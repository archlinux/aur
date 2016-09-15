pkgname=ammonite
pkgver=0.7.6
pkgrel=2
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.11.8
depends=("scala>=${_scalaver}")
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${pkgver}"
        'https://github.com/lihaoyi/Ammonite/raw/master/LICENSE')
noextract=("ammonite-repl-${pkgver}")
sha256sums=('2e048f5bceaa56ad0ce8c5af32b12761d6a64669b7aafb59cdc4bb4c18b02a16'
            '90320c4bcccf8df57cc5d6f7b0b1778231ae87c64fe5405bae45af4ff9f87e8e')
install="${pkgname}.install"

package() {
    install -Dm755 "ammonite-repl-${pkgver}" "${pkgdir}/usr/bin/amm"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

