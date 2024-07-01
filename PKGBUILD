# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="orbit"
pkgname="${_pkgname}-bin"
pkgver=3.3.0
pkgrel=1
pkgdesc="A cross-platform task runner for executing commands and generating files from templates"
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/gulien/orbit'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_armv6.tar.gz")
sha256sums_x86_64=('847529d6746ea962a4c45fd66ae044c4b3ff1d9b553324a4f6682c31ba0a51a6')
sha256sums_aarch64=('2375e596f623b673bf17d29321740be47f66f0eef7a2efd6d36656afcc74b9dd')
sha256sums_armv6h=('847cb5c76ef2a91510ee60ddd4ede2ece8c07a1f5246c9f74a8712e771e9e5f2')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
