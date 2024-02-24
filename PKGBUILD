# Maintainer: tee < teeaur at duck dot com >
pkgname=dbrest-bin
pkgver=0.0.68
pkgrel=1
pkgdesc="Spin up a REST API for any Major Database"
arch=(x86_64)
url="https://flarco.gitbook.io/dbrest"
license=('GPL')
provides=('dbrest')
conflicts=('dbrest')
source=("$pkgname-$pkgver.tgz::https://github.com/dbrest-io/dbREST/releases/download/v$pkgver/dbrest_linux_amd64.tar.gz")
sha256sums=('303466ab6484ce53a174626961ab00c3ca37087e05f04e0e7cb63e1d16ae7925')

package() {
    install -Dm0755 dbrest "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
