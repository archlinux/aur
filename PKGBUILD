# Maintainer: Adam Chovanec <git@adamchovanec.cz>
pkgname='grype-db-bin'
pkgver=0.54.2
pkgrel=1
pkgdesc='Application to create a Grype vulnerability database from upstream vulnerability data sources'
url='https://github.com/anchore/grype-db'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype-db/releases/download/v${pkgver}/grype-db_${pkgver}_linux_amd64.tar.gz")
sha256sums=('26eea89d72e0ada7c2fa7e273bb2c7074a046aa8b759daadb6aac126e8f3fe98')
package() {
	install -Dm755 "$srcdir/grype-db" "${pkgdir}/usr/bin/grype-db"
}
