# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.24
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("$url/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('7fa300552c05980e81812d45a8be9b2ed0efb0c724f6c5da15777a3f2ac02542a463b2fc205dfae51f67c661d0ac4c416f20b38384b52a55de88bcc688dc7015')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
