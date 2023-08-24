# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>

pkgname=ttf-plangothic
pkgver=1.8.5746
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
  'ff479e3a5efe8bc6dbde3492ae4f0c4c08ec3af3adc46b50b87b1b183dbffe87'
  'f08b08b1d470b196fb24e0e9afb30372481ecf409c1e2bbb88f7fa0bacec3b01'
  '0cc04930dcbd2e233275b9afc7bbb2093726ecc1d1f2a1c0ef9dee8ff04c89d3'
)

package() {
  install -Dm644 "$srcdir/PlangothicP1-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
  install -Dm644 "$srcdir/PlangothicP2-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
  install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
