# Maintainer: tee < teeaur at duck dot com >
pkgname=dbrest-bin
pkgver=0.0.80
pkgrel=1
pkgdesc="Spin up a REST API for any Major Database"
arch=(x86_64)
url="https://flarco.gitbook.io/dbrest"
license=('GPL')
provides=('dbrest')
conflicts=('dbrest')
source=("$pkgname-$pkgver.tgz::https://github.com/dbrest-io/dbREST/releases/download/v$pkgver/dbrest_linux_amd64.tar.gz")
sha256sums=('426ecaa34a728e44c72b6f8d631934194f57d9d93e4d7711f3f7646375fc63e3')

package() {
    install -Dm0755 dbrest -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
