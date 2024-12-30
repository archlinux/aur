# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.32.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries.'
arch=(x86_64)
url='https://sql-page.com'
_git='https://github.com/sqlpage/SQLPage'
license=('MIT')
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("$_git/releases/download/v$pkgver/sqlpage-linux.tgz")
sha256sums_x86_64=('ab583360f0e8f2500ef878bfb30512fbe797f0b6fce662a92fddf62e6a0a5892')

package() {
    install -Dm0755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -dm644 "$pkgdir/usr/share/sqlpage"
	cp -a sqlpage/* "$pkgdir/usr/share/sqlpage"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
