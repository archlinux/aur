# Maintainer: mcode10 <manas at designX6 dot com>
# Soupault Author: Daniil Baturin <daniil+soupault at baturin dot org>

pkgname=soupault
pkgver=4.5.0
pkgrel=1
pkgdesc="A static website management tool."
arch=('x86_64')
url="https://soupault.app/"
license=('MIT')
source=("https://files.baturin.org/software/${pkgname}/${pkgver}/${pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('8a052f7a5b1045c47ffa6e24b10b77c0785b4b9d967207b0a677ddd4ccb53b8f')

package() {
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux-${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
