# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=oneshot
pkgname=${_pkgname}-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Easily transfer files to and from your terminal and any browser'
arch=('x86_64')
url='https://github.com/raphaelreyna/oneshot'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-x86_64.tar.gz")
sha256sums=('2cc34898b9ac2852e225f65c0158acc3534448f10603928f4d3bcca2cfcb7cee')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
