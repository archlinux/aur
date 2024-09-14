_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.0
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
sha256sums=('d94c3d7a5209e108ecfd881bd936e1c26b5a2d217c0f2ab6ae0261f12e17804f')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
