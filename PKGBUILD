# Maintainer: mcode10 <manas at designX6 dot com>
# Soupault Author: Daniil Baturin <daniil+soupault at baturin dot org>

pkgname=soupault
pkgver=4.7.0
pkgrel=2
pkgdesc="A static website management tool."
arch=('x86_64' 'aarch64')
url="https://soupault.app/"
license=('MIT')
source_x86_64=("https://files.baturin.org/software/${pkgname}/${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://files.baturin.org/software/${pkgname}/${pkgver}/${pkgname}-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('c9ac32b23afd2eafb783493d71de9c7fed1c28cb44f54030f431168f84f095f4')
sha256sums_aarch64=('c968d612b009b201229baa69a032147a1b55333e9db6031c0135e2273e5e233f')

package() {
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
