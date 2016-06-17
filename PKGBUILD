# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='blindsql'
pkgver='1.0'
pkgrel=1
pkgdesc='Set of bash scripts for blind SQL injection attacks'
arch=('any')
url='http://www.enye-sec.org/programas/blindsql-v1-0/'
license=('unknown')
depends=('lynx')
source=('http://www.enye-sec.org/programas/blindsql.v1.0.tar.gz')
md5sums=('151f778cc77c8462a1ea13a093b5030b')

package() {
	cd "${srcdir}/blindsql.v1.0"
	install -dm755 "${pkgdir}/usr/bin"
        install -dm755 "${pkgdir}/usr/share/${pkgname}"
        chmod +x "sqldata.sh" && chmod +x "sqlcheck.sh"
        cp "sqldata.sh" "${pkgdir}/usr/bin/sqldata"
        cp "sqlcheck.sh" "${pkgdir}/usr/bin/sqlcheck"
        cp "readme.txt" "${pkgdir}/usr/share/${pkgname}/"
}
