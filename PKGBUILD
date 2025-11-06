# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.4.25
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url="https://docs.slingdata.io"
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('b6ed3318c577752413e299d831c5b16402bf24db8a97e70b120a434d6ae2eb4b')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
