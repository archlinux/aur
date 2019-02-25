# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=9.0.6
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.0.6/lin_32/vstudio_9_lin.rpm")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.0.6/lin_64/vstudio_x64_9_lin.rpm")
sha256sums_i686=('d4748187e714e39e59b96817a6eb27a1e3355316514a7b9c6d8cf5a989959e23')
sha256sums_x86_64=('96864bb6490e49ade4106d0a27dde16ecc52afd199cc0697b0ea7b490d06643c')

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}
