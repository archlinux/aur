# Maintainer: Adam Chovanec <git@adamchovanec.cz>
pkgname='grype-db-bin'
pkgver=0.53.4
pkgrel=1
pkgdesc='Application to create a Grype vulnerability database from upstream vulnerability data sources'
url='https://github.com/anchore/grype-db'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype-db/releases/download/v${pkgver}/grype-db_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7b571d78d1882b100297a08d7857bc0752f5ad60f4f135d18344c0c71dce4caf')
package() {
	install -Dm755 "$srcdir/grype-db" "${pkgdir}/usr/bin/grype-db"
}
