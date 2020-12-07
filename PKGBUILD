# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=three.js
pkgver=r123
pkgrel=1
pkgdesc='A JavaScript 3D Library which makes WebGL simpler'
url='https://threejs.org/'
arch=(any)
license=(MIT)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrdoob/three.js/archive/$pkgver.tar.gz")
sha256sums=('d9fc720b4bc8ce10e8b88156a6fdb1c008db2d247253c8c4196c88f12e160843')

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/threejs/examples
  cp -r build "$pkgdir"/usr/share/threejs/
  cp -r examples/js "$pkgdir"/usr/share/threejs/examples
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
