# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.14
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("https://github.com/xo/usql/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('434b6878d7de7bd71c4840832471e1b6f3a633e94bf9f72efa8ac07ed4baa2bc1f27fee45d4576683459cb948a654cbe4b675d676881e7e897d9cb2639003b18')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
