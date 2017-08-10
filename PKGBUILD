# Maintainer: artemtech <sofyanartem@gmail.com>
pkgname=tebu-icon-theme
pkgver=0.2
pkgrel=1
pkgdesc="Official icon sets from BlankOn"
arch=('any')
url="https://blankonlinux.or.id"
license=('GPL3')
depends=('gtk3')
source=("$pkgname"::"git+https://github.com/BlankOn/Tebu.git")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
	DESTDIR="${pkgdir}/usr/share/icons/Tebu"
	mkdir -p "$DESTDIR/"
	cp -R actions/ "$DESTDIR/"
	cp -R animations/ "$DESTDIR/"
	cp -R apps/ "$DESTDIR/"
	cp -R categories/ "$DESTDIR/"
	cp -R devices/ "$DESTDIR/"
	cp -R emblems/ "$DESTDIR/"
	cp -R extras/ "$DESTDIR/"
	cp -R io/ "$DESTDIR/"
	cp -R mimetypes/ "$DESTDIR/"
	cp -R places/ "$DESTDIR/"
	cp -R status/ "$DESTDIR/"
	cp -R stock/ "$DESTDIR/"
	install -Dm644 index.theme "$DESTDIR/"
}
