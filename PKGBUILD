# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='naabu'
pkgname="${_pkgname}-bin"
pkgver=2.0.2
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1fc6509079dc6c58dede7b4956e05f5aacfaa5e7020947555749166626a80306')
sha256sums_armv6h=('e8ec2204291c1ab572240ed9affbb913505737b7c156da2b4902c9a17206a2de')
sha256sums_aarch64=('17e8abd73c8ebd56826809f38783c013bfcacda6a791866746e19fe27be56e77')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
