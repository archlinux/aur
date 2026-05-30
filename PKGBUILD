# Maintainer: Jorryn Macris <jorryn.m116@gmail.com>
pkgname=minimal-translate
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal floating GTK translation widget"
arch=('any')
url="https://github.com/vicMJ/minimal-translate"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'translate-shell')
source=("translate-popup.py::https://raw.githubusercontent.com/vicMJ/minimal-translate/main/translate-popup.py"
  "minimal-translate.desktop::https://raw.githubusercontent.com/vicMJ/minimal-translate/main/minimal-translate.desktop"
  "minimal-translate.png::https://raw.githubusercontent.com/vicMJ/minimal-translate/main/minimal-translate.png")
sha256sums=('2a38d1b9fe222465b8425f579cd0d38a3f85a5abdd1fbe7007d1d0303e8c7cfc'
  '0f777c83f0d716689d9a1e67e25352808e11e9a5adb6fd7f9a709af65b594dcb'
  'dad0e94db696046b5643846c190fae91409a924bf17b426c54751bb299a3df01')
package() {
  install -Dm755 "$srcdir/translate-popup.py" "$pkgdir/usr/bin/minimal-translate"
  install -Dm644 "$srcdir/minimal-translate.desktop" "$pkgdir/usr/share/applications/minimal-translate.desktop"
  install -Dm644 "$srcdir/minimal-translate.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/minimal-translate.png"
}
