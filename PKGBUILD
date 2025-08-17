pkgname=libwasmtime
pkgver=35.0.0
pkgrel=1
pkgdesc="Wasmtime as library with C-bindings"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasmtime"
license=('Apache-2.0')
source=("https://github.com/bytecodealliance/wasmtime/releases/download/v${pkgver}/wasmtime-v${pkgver}-${arch}-linux-c-api.tar.xz")
sha256sums=('917bf16577fa96114bda15c7f14c147e3d78548e800d6b0b624df50ff9c1b937')

package() {
    mkdir -p ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/include ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/lib ${pkgdir}/usr
}
