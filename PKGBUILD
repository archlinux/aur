# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL3')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('5e1afca6a4446d7bec105c41955437d15b7169a1318cab9886d9d643cc0f9e4b')

package() {
    install -Dm755 sling -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
