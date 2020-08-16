# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=got
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
sha256sums=('22707b871f38a43fb1ee2a9667a73ed7ba3e3690dea6a5faadedd5db09c69b5b')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
