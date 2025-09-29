pkgname=libwasmtime
pkgver=37.0.0
pkgrel=1
pkgdesc="Wasmtime as library with C-bindings"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasmtime"
license=('Apache-2.0')
source=("https://github.com/bytecodealliance/wasmtime/releases/download/v${pkgver}/wasmtime-v${pkgver}-${arch}-linux-c-api.tar.xz")
sha256sums=('34749b52ef98e37bf7bf1076a6eaecb30f85a82aba78c7799e72ddacea2050fb')

package() {
    mkdir -p ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/include ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/lib ${pkgdir}/usr
}
