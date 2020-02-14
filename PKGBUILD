# Maintainer: Stezkoy <seracam@yandex.ru>
pkgname=chromemateria-gtk-theme
pkgver=1.0
pkgrel=2
pkgdesc="Based GTK Theme Materia and ChromeOS"
arch=('any')
url="https://github.com/stezkoy/chromemateria-gtk-theme"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("$pkgname"::"git+https://github.com/stezkoy/chromemateria-gtk-theme.git")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
	DESTDIR="${pkgdir}/usr/share/themes"
	mkdir -p "$DESTDIR/"
	cp -R ChromeMateria "$DESTDIR/"
}
