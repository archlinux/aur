# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omekasy"
pkgname="${_pkgname}-bin"
pkgver=1.2.3
pkgrel=1
pkgdesc="Convert alphanumeric characters to various styles defined in Unicode"
arch=('x86_64')
url="https://github.com/ikanago/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('76e104dcfb907e98f499976cf51d60743ee84d29d7a0fd44934e2987ca904ee4')

package() {
  cd "${srcdir}/archive"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
