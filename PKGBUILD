# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('b6584890d2dc8fa3a91b374bfb795f0a7842afabf0c7923ab2e9d247126d2d2300963a16ca9e84cb22ed40f839d3d2d26efbb4f93e3873e8494a355be88a683e')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
