# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.18
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("$url/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('703a4a11814b342567d296fdd965501a93046e5eb9603e8f5843e659c67675ee7a54a8d67c60502666c2d926273a849ecac3101c7665e2542aa1d38377a222bd')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
