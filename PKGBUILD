_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
depends=('libalpm.so' 'libcurl.so')
options=('!strip')

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-${CARCH}.tar.xz")
sha256sums=('f4566896afb10f23a4967d64afb93223494077e0ee0fe24700de7f35ecd51b97')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
