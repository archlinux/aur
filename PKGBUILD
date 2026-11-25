# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.14
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.14-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.14/standards-sync-0.0.14-unix.tar.gz")
sha256sums=('587256c9b66c09b2aa568285927db1a95ceb71aa0454f6ce8e8c8c6cabfbc4f9')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
