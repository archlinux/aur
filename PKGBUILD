_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.8
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('6cfd05e2b10d06b3f2d996d1a6dc7c77fd4fdb9f374060a1d1268ea13199c9d1')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
