# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=naabu
pkgname=${_pkgname}-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('GPL3')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('897d950aaefb41a096a7396eddd97712c1330521b3feb3fc36ea3d0998599cd1')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
