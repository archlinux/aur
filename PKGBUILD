# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>

pkgname=ttf-plangothic
pkgver=0.8.5744
pkgrel=2
pkgdesc='遍黑体项目（Plangothic Project）'
arch=(any)
url='https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project'
license=(OFL)
depends=(fontconfig)
source=(
  "https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP1-Regular.fallback.ttf"
  "https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP2-Regular.ttf"
  "https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/raw/main/LICENSE"
)
md5sums=(
  'df54afe4c7b7ad041e9810e07295ee06'
  'b14651028f8902296cd290e16b1bdbf6'
  '76f275fef4c3e68344037d125b1cbe10'
)

package() {
  install -Dm644 "$srcdir/PlangothicP1-Regular.fallback.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
  install -Dm644 "$srcdir/PlangothicP2-Regular.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
