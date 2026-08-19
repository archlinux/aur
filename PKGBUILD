# Maintainer: Borislav Borisov <borislav.borisov@yahoo.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=17.5.3
pkgrel=1
pkgdesc="Create, administer, query and explore DuckDB, ValentinaDB, MongoDB, MySQL, MariaDB, PostgreSQL, MS SQL Server & SQLite databases for FREE."
arch=('x86_64')
url="http://www.valentina-db.com"
license=('custom')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/${pkgver}/lin_64/vstudio_x64_17_lin.rpm")
sha256sums_x86_64=('77da4038d4e5858400aeb98843a41be0fa129671a012835a79fd119403156958')
options=(!debug)
package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
}
