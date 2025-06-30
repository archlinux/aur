# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.4.12
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL-3.0-only')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('65829c341f1829fa6d4b0325d4b874e8283a57dffa2b69b2c360e40ca1cc996c')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
