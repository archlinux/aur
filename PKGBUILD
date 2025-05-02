# Maintainer: tee < teeaur at duck dot com >
pkgname=sqlean-bin
pkgver=3.49.1
pkgrel=1
pkgdesc="sqlean shell is SQLite shell bundled with a collection of essential extensions ranging from regular expressions and math statistics to file I/O and dynamic SQL."
arch=(amd64 arm arm64 x86_64)
url="https://github.com/nalgeon/sqlite"
license=('MIT')
provides=(sqlean)
conflicts=(sqlean)
source=("sqlean-$pkgver::$url/releases/download/$pkgver/sqlean-ubuntu")
b2sums=('15b05fc0b4b722fe99ab8f8aee9501c772ea372ac4c8f136bb44a672b368e9cc477db7f4b5aa154004375ce68f956ad46e5f81be954afeb6b89d922386da0c61')

package() {
    install -Dm0755 "sqlean-$pkgver" "$pkgdir/usr/bin/sqlean"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
