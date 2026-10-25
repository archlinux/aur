# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mazter-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Mazes in your terminal"
arch=(x86_64)
url="https://dystroy.org/mazter/"
license=('MIT')
depends=()
provides=('mazter')
conflicts=('mazter')
source=("$pkgname-$pkgver.zip::https://dystroy.org/mazter/download/mazter_$pkgver.zip")
sha512sums=('6c3231c8eae367173b93df661ef355a922f982fc387f8ca055863511e4b441f4cd4ff1fa79d79c62db12b61f6b0b39ea5057817318754ada5011ebb5c6ff3b30')

package() {
  cd build
  install -D "$CARCH-linux/mazter" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
