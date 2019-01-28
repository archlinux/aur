# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=8.7.2
pkgrel=2
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/8.7.2/lin_32/vstudio_8_lin.rpm")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/8.7.2/lin_64/vstudio_x64_8_lin.rpm")
sha256sums_i686=('2ef0e9f1e07af9dd12f1525aea70a08fffb577c9690948986a8dca31204f7a19')
sha256sums_x86_64=('6980fca2543d3e591175630d71a76eb0639255697636b5144566ef973ee189a5')

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}
