# Maintainer: Kai Korla <kai@korla.cloud>
# Contributor: MrHacker <kmunoz@condorbs.net>

pkgname=mssql-server-fts
pkgver=16.0.4205.1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
source=("https://pmc-prod-afd-endpoint-evdhh8f8byhsezfp.b01.azurefd.net/rhel/8/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")
sha256sums=('7f814c34e17bf465ca8857263e84fde77fe9818ef2f90c396e810296cc3ebab5')
install=$pkgname.install
package() {
  depends=('mssql-server=16.0.4205.1')
  cd $pkgdir
  mv $srcdir/opt .
}
