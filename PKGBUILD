# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.16
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("https://github.com/xo/usql/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('cd7cf644e98199ad425994051eea9b8c0ebd4ac8bad29d8900f137deb06bff312b2b0a40a87b54135941ef0cfc6b12a9f36ebc722f6b42fb8bfeddd85e15d87a')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
