# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='chaos'
pkgname="${_pkgname}-client-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc='Client to communicate with Chaos DNS API'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/chaos-client'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-client_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-client_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-client_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('7d0d30718517a64edf88ce5ab50aea7cdd2027652815bfeb06f294445e0853c6')
sha256sums_armv6h=('2dd51671a127b1b9af936111838a505f47b4dfe98e63ade7529ae34feb469cfc')
sha256sums_aarch64=('b1deda446b8d32740a6e2c174ab367a448102d5cfbf34d1bd47517e026d1882d')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
