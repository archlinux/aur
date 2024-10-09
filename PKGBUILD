# Maintainer: Kai Korla <kai@korla.cloud>
pkgname=mssql-server-fts
pkgver=16.0.4150.1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
source=("https://packages.microsoft.com/rhel/9/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")
sha256sums=('39859d17a92094edbd0fb40ae04c6355fa80dd33ccdb9c0bc4ee758b3cf8408f')
install=$pkgname.install
package() {
        depends=('mssql-server=16.0.4150.1')

        cd $pkgdir
        mv $srcdir/opt .
}
