# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.16
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.16-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.16/standards-sync-0.0.16-unix.tar.gz")
sha256sums=('10a6b96fdcd3a043aaa11c73dc685a306688c916cae0099961b3609efeb5b856')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
