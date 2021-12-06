# Maintainer: ksandr <ru@ksandr.online>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=4.6
pkgrel=2
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2')
source=(${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/487)
md5sums=('EF8BF0BB8F2620627F5DC899203CE850')

package() {
	install -Dm644 ${srcdir}/${pkgname}/doc/Assistant_license_agreement.pdf "$pkgdir/usr/share/licenses/$pkgname/Assistant_license_agreement.pdf"
	install -Dm644 ${srcdir}/${pkgname}/scripts/assistant.desktop "$pkgdir/usr/share/applications/remote-assistant.desktop"	
		
	install -d ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* "${pkgdir}/opt/${pkgname}"
}