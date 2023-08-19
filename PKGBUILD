# Maintainer: mcode10 <manas at designX6 dot com>
# Soupault Author: Daniil Baturin <daniil+soupault at baturin dot org>

pkgname=soupault
pkgver=4.6.0
pkgrel=1
pkgdesc="A static website management tool."
arch=('x86_64')
url="https://soupault.app/"
license=('MIT')
source=("https://files.baturin.org/software/${pkgname}/${pkgver}/${pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('33622985b36d8712c9624fb3c79d1481e52d43ae2c989eea9de39930ddc22447')

package() {
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
