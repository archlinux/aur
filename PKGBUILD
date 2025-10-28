# Maintainer: Javier Tia <floss dot jetm dot me>

pkgname=c
pkgver=0.15.1
pkgrel=1
pkgdesc='Compile and execute C "scripts" in one go'
arch=('any')
url="https://github.com/ryanmjacobs/c"
license=('MIT')
provides=('c')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ecfad78cb0ab56da44dcfed805f5c261ddefd6dc4a4e57eb2dcfcffa85330605')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
