# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=ssh-chat
pkgname=${_pkgname}-bin
pkgver=1.10
pkgrel=2
pkgdesc='Chat over SSH'
arch=('x86_64')
url='https://github.com/shazow/ssh-chat'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tgz")
sha256sums=('a05b928639697eae56511b67ed5a414ea6930cb20b24171d1a9374dd74236522')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
