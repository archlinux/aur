pkgname=libwasmtime
pkgver=29.0.1
pkgrel=1
pkgdesc="Wasmtime as library with C-bindings"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasmtime"
license=('Apache-2.0')
source=("https://github.com/bytecodealliance/wasmtime/releases/download/v${pkgver}/wasmtime-v${pkgver}-${arch}-linux-c-api.tar.xz")
sha256sums=('27871520e02193badd5a83e16a5009c45371ec5ec9e1df8342b4a17efc3e35b6')

package() {
    mkdir -p ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/include ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/lib ${pkgdir}/usr
}
