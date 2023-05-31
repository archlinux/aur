pkgname=aacs-keydb
pkgrel=1
pkgver=1.0
pkgdesc='Contains the Key Database for the AACS Library'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=('http://fvonline-db.bplaced.net/export/keydb_eng.zip')
md5sums=('SKIP')

package() {
	install -d "${pkgdir}/etc/xdg/aacs" || return 1
	install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
