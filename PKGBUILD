# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL3')
provides=('sling-cli')
conflicts=('sling-cli')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('59d96a6e66171b4e53b95f1ed9e4091d866e41a026d46edad75220fd21441e99')

package() {
    install -Dm755 sling -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
