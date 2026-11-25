# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.15
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.15-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.15/standards-sync-0.0.15-unix.tar.gz")
sha256sums=('e3e8d358a9d54df3eeb51a53449a2c59a2c5fcde063a7eb6afca7dd2128008c7')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
