# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.19
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("$url/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('c870acb1278c92eb93755ffcaa02cd882cfb946eaf54d3923e96c2095aa89ec04e2bf34e6c50d20fef8f00072d24af366ed6adb77daa09fc6792a9e26c313ddf')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
