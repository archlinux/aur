_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

depends=('glibc' 'libalpm.so=15' 'libcurl.so=4')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-archlinux-${CARCH}.tar.xz")
sha256sums=('b7faaccb83e93d8655ef102664cd709d64a5c821247281c4461713f22aa1bddf')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
