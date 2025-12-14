_name=bin-cpuflags-x86
pkgname=${_name}-bin
pkgver=1.0.7
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (binary release)'
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux-${CARCH}.tar.xz")
sha256sums=('4238d5997cd7489c76f37172a50071ae06c1b8cd08dcc72e36e5c572e9e299da')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
