_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.10
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('b5176fcc4b16532aee3d1e5c245f272c8e8cb900562600310ececdf351fbe0e7')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
