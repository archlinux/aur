# Maintainer: tee < teeaur at duck dot com >
pkgname=sqlean-bin
pkgver=3.47.0
pkgrel=1
pkgdesc="sqlean shell is SQLite shell bundled with a collection of essential extensions ranging from regular expressions and math statistics to file I/O and dynamic SQL."
arch=(amd64 arm arm64 x86_64)
url="https://github.com/nalgeon/sqlite"
license=('MIT')
provides=(sqlean)
conflicts=(sqlean)
source=("sqlean-$pkgver::$url/releases/download/$pkgver/sqlean-ubuntu")
b2sums=('3d5d222237154ef8bfa6b01a1c7ff9f21ec08fa9d525f051876aa30b761250b8301da592e302a3220727ab89060050bc78acad06ef9b37b967ac0089c450e19d')

package() {
    install -Dm0755 "sqlean-$pkgver" "$pkgdir/usr/bin/sqlean"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
