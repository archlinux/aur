# Maintainer: Frank Bearoff fbearoff at gmail dot com
pkgname='wsl-open'
pkgver='2.2.1'
pkgrel=1
arch=('x86_64')
url="https://github.com//4U6U57/${pkgname}"
pkgdesc='Utility for opening files within the Windows Subsystem for Linux command line in Windows GUI applications.'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d831e624468967c3fdde361d5c0db02657e14cfcc73534bd6c4bbb6e9618667')

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
