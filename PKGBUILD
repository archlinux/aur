# Maintainer: ksandr <ru@ksandr.online>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=4.5
pkgrel=1
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('any')
license=('custom')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2')
source=(${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/466)
md5sums=('20EBE0EC0529496822411136D57E6A1D')

package() {
	install -Dm644 ${srcdir}/${pkgname}/doc/Assistant_license_agreement.pdf "$pkgdir/usr/share/licenses/$pkgname/Assistant_license_agreement.pdf"
	install -Dm644 ${srcdir}/${pkgname}/scripts/assistant.desktop "$pkgdir/usr/share/applications/remote-assistant.desktop"	
		
	install -d ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* "${pkgdir}/opt/${pkgname}"
}