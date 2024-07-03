# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="devdash"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="Highly Configurable Terminal Dashboard for Developers"
arch=('x86_64' 'i686' 'aarch64')
url="https://thedevdash.com"
_url="https://github.com/Phantas0s/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('355af24005512d6b3571a3e4facd3363d9d8023f09bfcea429cadf8707b64697')
sha256sums_i686=('dda1c201a30e2453386ebd54e1036d05a9eb19a1961ab4fa068071a367d081f9')
sha256sums_aarch64=('ba32e13f2618a7c571720a37bafe5712c9c344466d0be5602aecdcaa07e5127a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
