_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux.tar.xz")
sha256sums=('f68eae94cc851bacc321cf24b828a65622cddb1603e4216a40880fc30524ac3e')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
