_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.5
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
sha256sums=('a247bb1115ea55cdb2153244214ade75a35e9facb371fd104ff3c168e32699ee')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
