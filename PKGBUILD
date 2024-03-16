_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('1e2719138dcbf7d9dd1085fccdf80a5cf1f91e2d62e7e8551db71c7740159244')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
