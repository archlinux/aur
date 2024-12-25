# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.15
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("https://github.com/xo/usql/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('154da45e78cce3190ca42dfef3ca2645a77f14deb16c3b08cde1415f3f9a6e4d60615395964f5634b8d89724e0d932a91425129565760976ec77ecb862a9e18d')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
