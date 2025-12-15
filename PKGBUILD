# Maintainer: Kai Korla <kai@korla.cloud>
# Contributor: MrHacker <kmunoz@condorbs.net>

pkgname=mssql-server-fts
pkgver=16.0.4225.2
_remRevision=2
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server Full Text Search"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
source=("https://pmc-prod-afd-endpoint-evdhh8f8byhsezfp.b01.azurefd.net/rhel/8/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.${CARCH}.rpm")
sha256sums=('727166143629077b38c14d96e4731d2f7d76de734de1a7d156c70e2772b88541')
install=$pkgname.install
depends=('mssql-server=16.0.4225.2')

package() {
  cd $pkgdir
  mv $srcdir/opt .
}
