# Maintainer: Kai Korla <kai@korla.cloud>
pkgname=mssql-server-fts
pkgver=16.0.4105.2
_remRevision=2
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
depends=(
        'mssql-server=16.0.4105.2'
)
source=("https://packages.microsoft.com/rhel/9/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")
sha256sums=('182e131f8663587005718aaeb905343a70667edddde25d9f375f3185ae7958a3')
install=$pkgname.install
package() {
        cd $pkgdir
        mv $srcdir/opt .
}