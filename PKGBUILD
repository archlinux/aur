# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
sha256sums=('33a656b7de1e24b5fe84ddf5fc57d144be8edeec06aa7ac0a4f1ec17cdced0a1')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
