# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.10
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.10-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.10/standards-sync-0.0.10-unix.tar.gz")
sha256sums=('4fda9a90150bf63dbf76aae0c3e374fbe0411d3acf81ae10c12e4aa0772b4576')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
