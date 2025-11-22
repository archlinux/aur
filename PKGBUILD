_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('b9e3e02d54bda4e45da6cee6f61ae36f0a299340754c22798aad65ef308353c9')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
