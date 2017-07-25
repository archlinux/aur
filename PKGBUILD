# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=betcon
pkgver=1.2.3
pkgrel=1
pkgdesc="Sports betting management"
url="https://github.com/soker90/betcon"
arch=('any')
license=('GPLv3')
depends=('python' 'python-pyqt5')
source=('https://github.com/soker90/betcon/archive/1.2.3.tar.gz'
		'betcon.desktop')
md5sums=('c7d00afd25eda19dd9e30fb7a0d48abe'
	'60ba6f148a5ce300df6fb2b728576f7a')

package() {
	mkdir -p  ${pkgdir}/opt/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/betcon/
	install -D -m644 betcon.desktop ${pkgdir}/usr/share/applications/betcon.desktop
}
