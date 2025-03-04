_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.4
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
sha256sums=('f22a975612b4e87a5928f635229c3e41f66a8acbcc7f6b1c1bbcd68f7cb843b7')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
