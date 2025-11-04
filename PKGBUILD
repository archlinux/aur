# Maintainer: tee < teeaur at duck dot com >
pkgname=doltgres-bin
pkgver=0.52.4
pkgrel=1
pkgdesc="Doltgres is Dolt for Postgres | Version Controlled PostgreSQL"
arch=('x86_64')
url='https://doltgres.com'
license=('Apache-2.0')
provides=('doltgres')
conflicts=('doltgres')
source=("doltgresql-$pkgver-$arch.tgz::https://github.com/dolthub/doltgresql/releases/download/v$pkgver/doltgresql-linux-amd64.tar.gz")
sha256sums=('2e224d42614fa842ad445f96d89f95b6534865c23f76146c1e46b4107d9502cb')

package() {
	cd doltgresql-linux-amd64
    install -Dm755 bin/doltgres "$pkgdir/usr/bin/doltgres"
	install -Dm644 licenses/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
