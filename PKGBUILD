# Maintainer: tee < teeaur at duck dot com >
_pkg=prql
pkgname=prql-bin
pkgver=0.13.3
pkgrel=1
pkgdesc='PRQL is a modern language for transforming data — a simple, powerful, pipelined SQL replacement'
arch=(x86_64)
url='https://prql-lang.org'
_git='https://github.com/PRQL/prql'
license=(APACHE-2.0)
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("$_git/releases/download/$pkgver/prqlc-$pkgver-$arch-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('6b753329ce220dbda7908eb8398941435673e4535d2ee7690e63387dc0eca651')

package() {
    install -Dm0755 prqlc -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
