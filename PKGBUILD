# Maintainer: Kai Korla <kai@korla.cloud>
pkgname=mssql-server-fts
pkgver=16.0.4115.5
_remRevision=2
_prodver=${pkgver}-${_remRevision}
pkgrel=2
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
source=("https://packages.microsoft.com/rhel/9/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")
sha256sums=('db8052bdb9840f3c4c5c5f9ca7a30fc24cf92fd4eef54d0045b95fe791225a2a')
install=$pkgname.install
package() {
        depends=('mssql-server=16.0.4115.5')

        cd $pkgdir
        mv $srcdir/opt .
}