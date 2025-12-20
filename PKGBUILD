# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(x86_64)
url="https://github.com/xo/usql"
license=(MIT)
provides=(usql)
conflicts=(usql)
source=("$url/releases/download/v$pkgver/usql-$pkgver-linux-amd64.tar.bz2")
b2sums=('edad1edc82e6c1bbe1a9574fc0c65ce63a0eab9b3ec9a2c237b7f965437c76b570679d4cdfbc30776adbe9224dd2fbb6f048359ab3ab391b7dc512b60861fbf6')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4:
