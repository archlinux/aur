# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fast-ssh"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="Quickly connect to your services by navigating through your SSH config"
arch=('x86_64')
url="https://github.com/Julien-R44/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('090b9e707cfa1fa5ca71a73e519d0d2dd89735a81aedb2cdbcbc705a575a1a0d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
