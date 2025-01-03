# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.32.1
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries.'
arch=(x86_64)
url='https://sql-page.com'
_git='https://github.com/sqlpage/SQLPage'
license=('MIT')
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("sqlpage-$pkgver.tgz::$_git/releases/download/v$pkgver/sqlpage-linux.tgz")
sha256sums_x86_64=('a4aacfda4a25ee819e6439d334477eb9dec3b836943100da8a76ccfc70fdfd63')

package() {
    install -Dm0755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -dm644 "$pkgdir/usr/share/sqlpage"
	cp -a sqlpage/* "$pkgdir/usr/share/sqlpage"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
