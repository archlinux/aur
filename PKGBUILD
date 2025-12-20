_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.8
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
sha256sums=('416b48bc3923bf42daf6c2a963cd9d2a8a9e0aa7af182b17517b2ffeac62e913')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
