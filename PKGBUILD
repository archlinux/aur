# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=got
pkgname="${_pkgname}-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
sha256sums=('8dc436530af5d8ea809996a43aaff9f36ce61883102e99e60caaf311c3389431')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
