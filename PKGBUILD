# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=fake-ms-fonts
pkgver=0.0.2
pkgrel=4
pkgdesc='Aliases for Core TTF Fonts from Microsoft'
arch=('any')
url='https://www.eworm.de/'
license=('GPL')
depends=('fontconfig')
conflicts=('ttf-ms-fonts')
provides=('ttf-ms-fonts')
source=('56-fake-ms-fonts.conf')
sha256sums=('4ee68a34a667496b534292830094dac8df4d92fc644c06b89e4e1ac5a5cc5fc6')

package() {
	install -D -m0644 ${srcdir}/56-fake-ms-fonts.conf ${pkgdir}/etc/fonts/conf.avail/56-fake-ms-fonts.conf
	install -d ${pkgdir}/etc/fonts/conf.d/
	ln -s /etc/fonts/conf.avail/56-fake-ms-fonts.conf ${pkgdir}/etc/fonts/conf.d/56-fake-ms-fonts.conf
}

