# Maintainer: Dino Hensen <dino.hensen@gmail.com>

pkgname=cyber
pkgver=0.1
pkgrel=1
pkgdesc="Cyber - Fast and concurrent scripting"
arch=('x86_64')
url="https://github.com/fubark/cyber"
license=('MIT')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/fubark/cyber/releases/download/latest/cyber-linux-x64.tar.gz")
sha512sums_x86_64=('ca9b5ca4c3a418377355ea20ebe4a4e2c74e8035b649c4026a47b3d0f3f64d23a77c53eb9943f411e9e14b8e879fb56f6b1acef62cd5db3448b2db1de8105399')
depends=()
makedepends=()


package() {
    install -Dm755 "${srcdir}/cyber" "${pkgdir}/usr/local/bin/${pkgname}"
}
