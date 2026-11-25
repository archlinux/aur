# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.12
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.12-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.12/standards-sync-0.0.12-unix.tar.gz")
sha256sums=('fa8e4ae0fe7ee774e7567a64992d3c142e256c76defaab4ea2a9426392180725')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
