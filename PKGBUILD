# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='naabu'
pkgname="${_pkgname}-bin"
pkgver=1.1.4
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/naabu'
license=('GPL3')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('897d950aaefb41a096a7396eddd97712c1330521b3feb3fc36ea3d0998599cd1')
sha256sums_armv6h=('2faa469944e9613d8bb9b6e8576a75a51bb0e9b772ea266a17ce970ef88c41e9')
sha256sums_aarch64=('ed25d88d7dc15f6a9627d66548ef993dcfa4ed35b037232678584bbc6fa002a5')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
