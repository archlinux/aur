# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.6.6
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('c369a8fe806a2f1f7cfd3de223009f17a0e323ba1e29445996f4f7261c38fbe80f8ef2ffb8b23ab6030b1375b64c0b5fd28612cea180ab849bed8e183606247b')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
