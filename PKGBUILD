_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.6
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
sha256sums=('9c219451438ca73a13a3c61e33f15ff174d439476b2f376a27421988974681bd')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
