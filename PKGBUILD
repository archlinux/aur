# Maintainer: ABOhiccups <@ABOhiccups on Twitter>
pkgname=fusion-icon-autostart
pkgver=1.00
pkgrel=1
pkgdesc="This will autostart fusion-icon with 20 seconds delay after login"
arch=('any')
url="https://github.com/ABOhiccups/fusion-icon-autostart"
license=('Autostart')
depends=('fusion-icon')
checkdepends=()
optdepends=()
install=
changelog=
source=("https://github.com/ABOhiccups/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('911ad87cfc03fc35c60717d2606f901e')

package() {
	cd "${srcdir}/$pkgname"
	sudo cp autostart /usr/share/compiz/
	cp fusion-icon.desktop ~/.config/autostart/
}
