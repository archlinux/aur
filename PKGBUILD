_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.0.10
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
sha256sums=('95ea3f9a91298da98ec5dabc070ff6b1bbefaa0ca519443288df2be119a7e3f7')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
