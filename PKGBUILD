# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=chaos
pkgname="${_pkgname}-client-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc='Client to communicate with Chaos DNS API'
arch=('x86_64')
url='https://github.com/projectdiscovery/chaos-client'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-client_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7d0d30718517a64edf88ce5ab50aea7cdd2027652815bfeb06f294445e0853c6')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
