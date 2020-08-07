# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=shuffledns
pkgname=${_pkgname}-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='MassDNS wrapper to resolve and enumerate valid subdomains'
arch=('x86_64')
url='https://github.com/projectdiscovery/shuffledns'
license=('GPL3')
depends=('massdns')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('492fdfc44d4aa7790cdf1c850b0ed8211da39bbc783eda9fa77f4064100dbc0f')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
