# Maintainer: Adam Chovanec <git@adamchovanec.cz>
pkgname='grype-db-bin'
pkgver=0.47.3
pkgrel=1
pkgdesc='Application to create a Grype vulnerability database from upstream vulnerability data sources'
url='https://github.com/anchore/grype-db'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype-db/releases/download/v${pkgver}/grype-db_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f2578a764c06b18a4e5edcdc3c42acb9ab0af285db831ae60bfadec8daeb5f4b')
package() {
	install -Dm755 "$srcdir/grype-db" "${pkgdir}/usr/bin/grype-db"
}
