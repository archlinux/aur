pkgname=libwasmtime
pkgver=32.0.0
pkgrel=1
pkgdesc="Wasmtime as library with C-bindings"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasmtime"
license=('Apache-2.0')
source=("https://github.com/bytecodealliance/wasmtime/releases/download/v${pkgver}/wasmtime-v${pkgver}-${arch}-linux-c-api.tar.xz")
sha256sums=('0620132e0e3710ef99875fc8ebad9aedc16312b7f8e8b9950ff1b0869a2e1dbb')

package() {
    mkdir -p ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/include ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/lib ${pkgdir}/usr
}
