# Maintainer: Adam Chovanec <git@adamchovanec.cz>
pkgname='grype-db-bin'
pkgver=0.52.1
pkgrel=1
pkgdesc='Application to create a Grype vulnerability database from upstream vulnerability data sources'
url='https://github.com/anchore/grype-db'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype-db/releases/download/v${pkgver}/grype-db_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2cd9f740627aa586f16eef7c8747936ff9490fb1f2d3998b661cedf73ea675d4')
package() {
	install -Dm755 "$srcdir/grype-db" "${pkgdir}/usr/bin/grype-db"
}
