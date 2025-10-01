# Maintainer: tee < teeaur at duck dot com >
pkgname=doltgres-bin
pkgver=0.52.1
pkgrel=1
pkgdesc="Doltgres is Dolt for Postgres | Version Controlled PostgreSQL"
arch=('x86_64')
url='https://doltgres.com'
license=('Apache-2.0')
provides=('doltgres')
conflicts=('doltgres')
source=("doltgresql-$pkgver-$arch.tgz::https://github.com/dolthub/doltgresql/releases/download/v$pkgver/doltgresql-linux-amd64.tar.gz")
sha256sums=('8367ff290cd685006037d49075cf98f6629cb624ce95b960998e445531f5abeb')

package() {
	cd doltgresql-linux-amd64
    install -Dm755 bin/doltgres "$pkgdir/usr/bin/doltgres"
	install -Dm644 licenses/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
