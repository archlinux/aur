_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.2
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
sha256sums=('3771f81d4370ac59b29731ad26c879399dc9fcec1cdf2006ac12940e967de3a7')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
