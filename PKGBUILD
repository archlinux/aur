# Maintainer: tee < teeaur at duck dot com >
pkgname=sqlean-bin
pkgver=3.46.0
pkgrel=1
pkgdesc="sqlean shell is SQLite shell bundled with a collection of essential extensions ranging from regular expressions and math statistics to file I/O and dynamic SQL."
arch=(amd64 arm arm64 x86_64)
url="https://github.com/nalgeon/sqlite"
license=('MIT')
provides=(sqlean)
conflicts=(sqlean)
source=("sqlean-$pkgver::$url/releases/download/$pkgver/sqlean-ubuntu")
b2sums=('fabfe5d31ad948046bddabd6d3f50896ad68e11de8a1f4ad8a647179710e9bf09ffc72b2d452af90a8e665e5e5021959c39007ce92731e144e83b8c6f025d482')

package() {
    install -Dm0755 "sqlean-$pkgver" "$pkgdir/usr/bin/sqlean"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
