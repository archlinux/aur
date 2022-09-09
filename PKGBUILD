# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=easyrp-bin
pkgver=3.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/Pizzabelly/EasyRP"
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://github.com/Pizzabelly/EasyRP/releases/download/v${pkgver}/EasyRP-v${pkgver}-linux.tar.gz")
sha256sums=('5c8e9a0ced691afd881b258285e0b87b0a30ae136997c19d60b09a6600556ba9')


package() {
    cd "EasyRP-$pkgver-linux"
    _dest="${pkgdir}/opt/${pkgname}"
    install -D ${pkgname} "${_dest}/${pkgname}"
    install -Dm644 config.ini "${_dest}/config.ini"
}
