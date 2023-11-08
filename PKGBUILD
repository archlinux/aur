_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.8
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
sha256sums=('3b402bbf7086dbe5ef77454cbbe63756d1914ebfcc6f17fb8958ff9ce83ea223')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
