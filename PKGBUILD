# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=oneshot
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Easily transfer files to and from your terminal and any browser'
arch=('x86_64')
url='https://github.com/raphaelreyna/oneshot'
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-x86_64.tar.gz")
sha256sums=('eea35b2ff2f166c397ccf754a2b0af9b32793f8f5553473ded0109d579bec2ed')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
}

# vim: ts=2 sw=2 et:
