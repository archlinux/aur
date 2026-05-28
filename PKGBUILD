pkgname=aodv-bin
_pkgname=aodv
pkgver=0.2.2
pkgrel=1
pkgdesc='Userspace AODV control-plane implementation based on RFC 3561'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/aodv-rs'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('65768f73a438d567bfb45d73138d397a9619b0286a49e265a51cd0e08fd253e2')
sha256sums_aarch64=('9c78210f2e7a8d4150bb2e3d4fe9df6dcea150cb37ec46537011d82badb858a5')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
