# Maintainer: Beefsizzle <beefsizzle@gmail.com>
pkgname=niri-ocr
pkgver=1.0.0
pkgrel=1
pkgdesc="CleanShot X-style OCR text capture for niri: select a region, get text in clipboard"
arch=(any)
url="https://github.com/Beefsizzle/niri-ocr"
license=(MIT)
# niri 25.11 added the `--path` argument to the screenshot action.
depends=(tesseract tesseract-data-eng wl-clipboard libnotify 'niri>=25.11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cac6402cf78ea1d0af31b1b9c749707c79c439755ec7644a696e05cef628aa46')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 niri-ocr "$pkgdir/usr/bin/niri-ocr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/niri-ocr/LICENSE"
}
