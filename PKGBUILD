# Maintainer: artemtech <sofyanartem@gmail.com>
pkgname=tebu-flat-icon-theme
pkgver=0.1.4
pkgrel=2
pkgdesc="flat version of tebu-icon-theme from BlankOn"
arch=('any')
url="https://blankonlinux.or.id"
license=('GPL3')
depends=('gtk3' 'tebu-icon-theme')
source=("$pkgname"::"git+https://github.com/BlankOn/tebu-flat.git")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}/Tebu-Flat
	DESTDIR="${pkgdir}/usr/share/icons/Tebu-Flat"
	mkdir -p "$DESTDIR/"
	cp -R actions/ "$DESTDIR/"
	cp -R apps/ "$DESTDIR/"
	cp -R categories/ "$DESTDIR/"
	cp -R devices/ "$DESTDIR/"
	cp -R places/ "$DESTDIR/"
	cp -R status/ "$DESTDIR/"
	install -Dm644 index.theme "$DESTDIR/"
}
