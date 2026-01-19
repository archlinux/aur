_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

depends=('glibc' 'libalpm.so=16' 'libcurl.so=4')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-archlinux-${CARCH}.tar.xz")
sha256sums=('8b702ae1306f05c444665f5e36cfe3371d05bf76f54ea1e04b38e614fc7559dd')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
