# Maintainer: Dino Hensen <dino.hensen@gmail.com>

pkgname=cyber
pkgver=0.1
pkgrel=2
pkgdesc="Cyber - Fast and concurrent scripting"
arch=('x86_64')
url="https://github.com/fubark/cyber"
license=('MIT')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/fubark/cyber/releases/download/latest/cyber-linux-x64.tar.gz")
sha512sums_x86_64=('4b34f9ecf361b071788a8f58b73368cf69ff0c1599fbfd7661032a501f62f995564ede10b107fa4b66460647ddc8e6e43ff0639cb8e80762f3778ce6fa5dcf2a')
depends=()
makedepends=()


package() {
    install -Dm755 "${srcdir}/cyber" "${pkgdir}/usr/local/bin/${pkgname}"
}
