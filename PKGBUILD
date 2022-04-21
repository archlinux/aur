# Maintainer: ksandr <ru@ksandr.online>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=4.8
pkgrel=1
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2')
source=(${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/545)
md5sums=('C77E7E2FE1070A8675368C0EFEC93F00')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -Dm644 ${pkgdir}/opt/assistant/license/License.rtf "$pkgdir/usr/share/licenses/$pkgname/License.rtf"
	install -Dm644 ${pkgdir}/opt/assistant/scripts/assistant.desktop "$pkgdir/usr/share/applications/remote-assistant.desktop"
}