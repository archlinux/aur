# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=octosql-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="OctoSQL is a query tool that allows you to join, analyse and transform data from multiple databases and file formats using SQL"
arch=('x86_64')
url='https://github.com/cube2222/octosql'
license=('MIT')
depends=('glibc')
provides=('octosql')
source=("${pkgname}-${pkgver}::https://github.com/cube2222/octosql/releases/download/v${pkgver}/octosql-linux"
				'LICENSE::https://github.com/cube2222/octosql/raw/master/LICENSE')
sha256sums=('6b28fa93a511887d57fc94ffea5fe96fd1604a8afd9d540d55b96d68f56a4f3d'
						'd43ace6a50d397cb34d7fcad19c4ef54f440828aed05b5b2edc7db2742f55d97')

package() {
	install -Dm755 "${srcdir}"/octosql* "${pkgdir}/usr/bin/octosql"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}