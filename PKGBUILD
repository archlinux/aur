# Maintainer: mcode10 <manas at designX6 dot com>
# Soupault Author: Daniil Baturin <daniil+soupault at baturin dot org>

pkgname=soupault
pkgver=4.7.0
pkgrel=1
pkgdesc="A static website management tool."
arch=('x86_64')
url="https://soupault.app/"
license=('MIT')
source=("https://files.baturin.org/software/${pkgname}/${pkgver}/${pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('c9ac32b23afd2eafb783493d71de9c7fed1c28cb44f54030f431168f84f095f4')

package() {
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
