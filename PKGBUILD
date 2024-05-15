# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=octosql-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="OctoSQL is a query tool that allows you to join, analyse and transform data from multiple databases and file formats using SQL"
arch=('x86_64')
url='https://github.com/cube2222/octosql'
license=('MIT')
depends=('glibc')
provides=('octosql')
source=("https://github.com/cube2222/octosql/releases/download/v${pkgver}/octosql_${pkgver}_linux_amd64.tar.gz")
sha256sums=('49963463c2dc515bedd7e9d77e0e75a394532102ce878caa097250a8260aa815')

package() {
  install -Dm755 "${srcdir}"/octosql "${pkgdir}/usr/bin/octosql"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
