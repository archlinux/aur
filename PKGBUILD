# Maintainer: tee < teeaur at duck dot com >
pkgname=doltgres-bin
pkgver=0.54.7
pkgrel=1
pkgdesc="Doltgres is Dolt for Postgres | Version Controlled PostgreSQL"
arch=('x86_64')
url='https://doltgres.com'
license=('Apache-2.0')
provides=('doltgres')
conflicts=('doltgres')
source=("doltgresql-$pkgver-$arch.tgz::https://github.com/dolthub/doltgresql/releases/download/v$pkgver/doltgresql-linux-amd64.tar.gz")
sha256sums=('7e33fd5ceba726a5f020656624f906a1c0c86471ab08d3c7770fb186b7297a1f')

package() {
	cd doltgresql-linux-amd64
    install -Dm755 bin/doltgres "$pkgdir/usr/bin/doltgres"
	install -Dm644 licenses/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
