# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mazter-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Mazes in your terminal"
arch=(x86_64)
url="https://github.com/canop/mazter"
license=('MIT')
depends=('gcc-libs')
provides=('mazter')
conflicts=('mazter')
source_x86_64=("$pkgname-$pkgver.zip::https://dystroy.org/mazter/download/mazter_$pkgver.zip")
sha512sums_x86_64=('9e1575c57c1131b0793920cd95fe8185bacb7ed45b94657fa57e11671247cd35a4b5303e8f33fa684cc91a2d233042131fa83990bf173b47b7efc034c196f9ad')

package() {
  cd build
  install -D "$CARCH-linux/mazter" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
