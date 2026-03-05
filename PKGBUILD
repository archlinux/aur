# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
# Maintainer: Georgel Preput <georgelpreput <at> mailbox <dot> org>
pkgname=databricks-cli-bin
_pkgname=databricks-cli
provides=($_pkgname)
conflicts=('python-databricks-cli' 'python-dbx')
pkgver=0.292.0
pkgrel=1
pkgdesc="Databricks CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/databricks/cli"
license=('custom:databricks')
makedepends=('unzip')
depends=()
source_x86_64=("https://github.com/databricks/cli/releases/download/v${pkgver}/databricks_cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/databricks/cli/releases/download/v${pkgver}/databricks_cli_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('24e48742c14aa18626d53921cb38f8aa196a8ed4ac9d678cf6a5547ed754ec85')
sha256sums_aarch64=('e0ed1b48432598650167317811d27f1d211c9f84635c3fe657020061ffa91353')

package() {
	install -Dm0755 $srcdir/databricks $pkgdir/usr/bin/databricks
	install -Dm0644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
