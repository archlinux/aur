# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>

pkgname=ttf-plangothic
pkgver=1.8.5752
pkgrel=1
pkgdesc='遍黑体项目（Plangothic Project）'
arch=(any)
url='https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project'
license=(OFL)
depends=(fontconfig)
source=(
  PlangothicP1-Regular-$pkgver.ttf::"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP1-Regular.fallback.ttf"
  PlangothicP2-Regular-$pkgver.ttf::"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP2-Regular.ttf"
  $pkgname-LICENSE::"https://raw.githubusercontent.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic/V$pkgver/LICENSE"
)
sha256sums=(
  '5c0d547f9a34f125d0bf2e0d61822c40b8bfb65f88119dff8b52d37f2f781981'
  '07bf3d045942fa9cacf362ee54180e1ade4bbadc5292e314a0f89c659e96299d'
  '0cc04930dcbd2e233275b9afc7bbb2093726ecc1d1f2a1c0ef9dee8ff04c89d3'
)

package() {
  install -Dm644 "$srcdir/PlangothicP1-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
  install -Dm644 "$srcdir/PlangothicP2-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
  install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
