# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=9.1.3
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.1.3/lin_32/vstudio_9_lin.rpm")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.1.3/lin_64/vstudio_x64_9_lin.rpm")
sha256sums_i686=('63726e4d53ad7d9ed8657fa8cae5b6147f0284d9cc2923e507593be05a7c3491')
sha256sums_x86_64=('829f5e30ef4dd607b45662d11b7a596c35da4196e8637ecb647c563f637b605a')

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}
