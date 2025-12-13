_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.7
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
sha256sums=('f0266a01842b7fdce4e1c22f6997499be8e091278d2d08b7fa6b5ca34a6e1fa9')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
