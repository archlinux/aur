# Maintainer: tee < teeaur at duck dot com >
_pkg=prql
pkgname=prql-bin
pkgver=0.13.2
pkgrel=1
pkgdesc='PRQL is a modern language for transforming data — a simple, powerful, pipelined SQL replacement'
arch=(x86_64)
url='https://prql-lang.org'
_git='https://github.com/PRQL/prql'
license=(APACHE-2.0)
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("$_git/releases/download/$pkgver/prqlc-$pkgver-$arch-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('85c4eab7bc5b6a9e221fcfb7ef93eab61cc0f4c561c1013890a87952ffafceac')

package() {
    install -Dm0755 prqlc -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
