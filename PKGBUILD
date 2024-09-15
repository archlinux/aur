_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.1
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
sha256sums=('6e68f8bd2bca1c7f04fe69adbe7335beceae3a92c4b7ef1b53c9fd35686ec9fe')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
