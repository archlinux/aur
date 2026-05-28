pkgname=tiny-ping-bin
_pkgname=tiny-ping
pkgver=0.7.1
pkgrel=1
pkgdesc='Small Asynchronous ICMP library and CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/tiny-ping'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('20ccd20a443102443fbd85c592174fa6a1b5f8bdf856b3cec928a0c031bd5f9b')
sha256sums_aarch64=('ecabe246737d54d05c78e90c363273fe4232bdcc91fcc202c419b74772d485a1')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
