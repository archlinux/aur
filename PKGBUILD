# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.26
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("$url/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('415db590cf5c86765e491408961f9aa3e3dd054d82a2b35537aaac7fada24aef98c61eb44a8cfcd4c90c39080501198060e22a29c81a1d5663900e60f74c5dcf')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4:
