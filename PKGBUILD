_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('84b40d05c8737be46d5a99d86717d8372b80d4de8dbe06af809c5652fa59020c')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
