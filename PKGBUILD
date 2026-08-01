# Maintainer: emmgee
pkgname=omarchy-cmd-ocr-niri
pkgver=1.0.0
pkgrel=1
pkgdesc="CleanShot X-style OCR text capture for niri — select a region, get text in clipboard (niri port of omarchy-cmd-ocr)"
arch=(any)
url="https://github.com/emmgeede/omarchy-cmd-ocr"
license=(MIT)
depends=(tesseract tesseract-data-eng grim slurp wayfreeze wl-clipboard libnotify)
provides=(omarchy-cmd-ocr)
conflicts=(omarchy-cmd-ocr)

package() {
  install -Dm755 "$startdir/omarchy-cmd-ocr" "$pkgdir/usr/bin/omarchy-cmd-ocr"
  install -Dm644 "$startdir/niri-bindings.kdl" "$pkgdir/usr/share/omarchy-cmd-ocr/niri-bindings.kdl"
}
