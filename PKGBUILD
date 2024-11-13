# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.12
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql/"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("https://github.com/xo/usql/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('9176d20ad99b73b54093dec680b05ad60c6c55361e4380611c88b7fa25a0ed1ae3b72bc91a1deb358a536ce18339bd414fd85b450ba6801ff77406713dc75a79')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
