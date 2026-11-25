# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
pkgname=standards-sync
pkgver=0.0.13
pkgrel=1
pkgdesc='Keep the code standards in sync without losing edits'
arch=('any')
url='https://github.com/sebastienrousseau/standards'
license=('Apache-2.0 OR MIT')
depends=('python' 'git')
source=("standards-sync-0.0.13-unix.tar.gz::https://github.com/sebastienrousseau/standards/releases/download/v0.0.13/standards-sync-0.0.13-unix.tar.gz")
sha256sums=('89704622e94a0ed356e0eb365beee675679f8587f782fcc95320ca655b509f61')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
}
