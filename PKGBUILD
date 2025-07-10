# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.4.13
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL-3.0-only')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('0fc017898a90e9109b61a82bc1d8c1497844cc2f875a07f81875e0493775d680')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
