# Maintainer: artemtech <sofyanartem@gmail.com>
pkgname=bromo-gtk-theme
pkgver=1.4
pkgrel=1
pkgdesc="A theme for Manokwari on BlankOn. Based on Arc Theme."
arch=('x86_64')
url="https://blankonlinux.or.id"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("$pkgname"::"git+https://github.com/BlankOn/bromo-theme.git")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
	DESTDIR="${pkgdir}/usr/share/themes"
	mkdir -p "$DESTDIR/"
	cp -R Bromo "$DESTDIR/"
}
