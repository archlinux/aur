# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=octosql-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="OctoSQL is a query tool that allows you to join, analyse and transform data from multiple databases and file formats using SQL"
arch=('x86_64')
url='https://github.com/cube2222/octosql'
license=('MIT')
provides=('octosql')
source=("https://github.com/cube2222/octosql/releases/download/v0.2.0/octosql-linux")
md5sums=('224fab1a98fa798d6748b1f9d5114e37')

package() {
	cd "${srcdir}"
	install -Dm755 octosql-linux "${pkgdir}/usr/bin/octosql"
}