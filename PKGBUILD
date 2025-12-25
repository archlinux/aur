pkgname=libwasmtime
pkgver=40.0.0
pkgrel=1
pkgdesc="Wasmtime as library with C-bindings"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasmtime"
license=('Apache-2.0')
source=("https://github.com/bytecodealliance/wasmtime/releases/download/v${pkgver}/wasmtime-v${pkgver}-${arch}-linux-c-api.tar.xz")
sha256sums=('a52816587989fe15d6ddb60366ee0e9b617b6cbb7eff0cade782b3f0613e719d')

package() {
    mkdir -p ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/include ${pkgdir}/usr
    cp -r wasmtime-v${pkgver}-${arch}-linux-c-api/lib ${pkgdir}/usr
}
