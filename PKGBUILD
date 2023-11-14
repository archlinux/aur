_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
depends=('libalpm.so' 'libcurl.so')
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-archlinux-${CARCH}.tar.xz")
sha256sums=('88296df4e9ae29b6c69583ae5af8e02ff97f582dc4decbfb7a294496f4cb8f08')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
