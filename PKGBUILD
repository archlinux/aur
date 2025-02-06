# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL3')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('9ce22de0d7b989168a4613a9326ed2f65ec24506e4febb11054dd25c6ab27b64')

package() {
    install -Dm755 sling -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
