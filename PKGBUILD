# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.2.20
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL3')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('433034bdd40ed905751d7e9b39363f7e34232c0591d340e811a880e5698156e9')

package() {
    install -Dm755 sling -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
