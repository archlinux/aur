_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.6
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
sha256sums=('6a4054a9577c2478b5a76fcbb7e0d2faea5a5b962eb1c74faa5b092f9bd01a45')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
