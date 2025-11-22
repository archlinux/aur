_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.5
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
sha256sums=('0b1e2b619969c56d5232b387f2939688517fa1b6953ea4769ae5322db4a14a42')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
