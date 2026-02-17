# Maintainer: emmgee
pkgname=omarchy-cmd-ocr
pkgver=1.0.0
pkgrel=1
pkgdesc="CleanShot X-style OCR text capture for Hyprland — select a region, get text in clipboard"
arch=(any)
url="https://github.com/emmgeede/omarchy-cmd-ocr"
license=(MIT)
depends=(tesseract tesseract-data-eng grim slurp wayfreeze wl-clipboard jq libnotify hyprland)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emmgeede/omarchy-cmd-ocr/archive/v$pkgver.tar.gz")
sha256sums=('b2d589ae036f51b5225a4e20220312be8a897c85dd08ebbca239f347c30a13f2')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 omarchy-cmd-ocr "$pkgdir/usr/bin/omarchy-cmd-ocr"
  install -Dm644 hyprland-bindings.conf "$pkgdir/usr/share/omarchy-cmd-ocr/hyprland-bindings.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/omarchy-cmd-ocr/LICENSE"
}
