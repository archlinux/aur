_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

depends=('libalpm.so=14' 'libcurl.so=4')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-archlinux-${CARCH}.tar.xz")
sha256sums=('89f43fcf67b78623c3c621f3ad0b10871d9a700abe335a1d66b7763aa09ded07')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
