# Maintainer: Kai Korla <kai@korla.cloud>
# Contributor: MrHacker <kmunoz@condorbs.net>

pkgname=mssql-server-fts
pkgver=16.0.4195.2
_remRevision=4
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
source=("https://pmc-prod-afd-endpoint-evdhh8f8byhsezfp.b01.azurefd.net/rhel/8/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")
sha256sums=('0ad8f3cee815e67d691c8b08783d90921da0c162a5fa32ccea28eb7d0ef6705e')
install=$pkgname.install
package() {
        depends=('mssql-server=16.0.4185.3')
        cd $pkgdir
        mv $srcdir/opt .
}
