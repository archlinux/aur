_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('51392f168c2c7ef03644058e806d04e34b0c1413e2cc8108f49406e11382e00d')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
