# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='ssh-chat'
pkgname="${_pkgname}-bin"
pkgver=1.10
pkgrel=2
pkgdesc='Chat over SSH'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/shazow/ssh-chat'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tgz")
source_armv7h=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_arm.tgz")
source_aarch64=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.tgz")

sha256sums_x86_64=('a05b928639697eae56511b67ed5a414ea6930cb20b24171d1a9374dd74236522')
sha256sums_armv7h=('29ae74029187edde33d6bc34408b2d0431b2c811b0193213e441f45c3f9d8148')
sha256sums_aarch64=('29ae74029187edde33d6bc34408b2d0431b2c811b0193213e441f45c3f9d8148')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
