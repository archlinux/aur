# Maintainer: Adam Chovanec <git@adamchovanec.cz>
pkgname='grype-db-bin'
pkgver=0.50.0
pkgrel=1
pkgdesc='Application to create a Grype vulnerability database from upstream vulnerability data sources'
url='https://github.com/anchore/grype-db'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype-db/releases/download/v${pkgver}/grype-db_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4998f349d5e11e35f8169ebbcac5d52bfb5f77cb629358b4cbf9862e0e3e7327')
package() {
	install -Dm755 "$srcdir/grype-db" "${pkgdir}/usr/bin/grype-db"
}
