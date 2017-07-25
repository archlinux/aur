# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=betcon
pkgver=1.2.2
pkgrel=1
pkgdesc="Sports betting management"
url="https://github.com/soker90/betcon"
arch=('any')
license=('GPLv3')
depends=('python' 'python-pyqt5')
source=('https://github.com/soker90/Betcon/archive/1.2.2.tar.gz'
		'betcon.desktop')
md5sums=('339a53e931d67e46e4fb1e63c0c64903'
	'60ba6f148a5ce300df6fb2b728576f7a')

package() {
	mkdir -p  ${pkgdir}/opt/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/betcon/
	install -D -m644 betcon.desktop ${pkgdir}/usr/share/applications/betcon.desktop
}
