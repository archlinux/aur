# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.8.1.0
pkgrel=1
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('proprietary')

_file='librtpkcs11ecp.so'
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('38a463ec35d9958fd91befdd544d2695daf8678cbe49107c9c08b8bf5daeb444')

package() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	cp -a "${srcdir}/opt" "${pkgdir}/"
	cp -a "${srcdir}/usr" "${pkgdir}/"
}
