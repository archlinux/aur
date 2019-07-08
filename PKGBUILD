# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=9.3.1
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.3.1/lin_32/vstudio_9_lin.rpm")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://valentina-db.com/download/prev_releases/9.3.1/lin_64/vstudio_x64_9_lin.rpm")
sha256sums_i686=('274f2c2b2620f0bf5bc22fc2f04c943d9f85e7f0ca4bdbecf3f7d6d25182eaea')
sha256sums_x86_64=('15f1d33a6ee0a9e8937a8e5674360cf08a902a97f44adfbf67a6ded82223a3e2')

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}
