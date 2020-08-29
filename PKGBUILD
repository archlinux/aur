# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
sha256sums=('a9b553d5c701388f657e88f6cc46d3f8470898b03f490ec1a4b6220f9d1eb1ab')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
