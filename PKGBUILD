# Maintainer: Your Name <you at domain dot tld>
pkgname=minimal-translate
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal floating GTK translation widget"
arch=('any')
url="https://github.com/vicMJ/minimal-translate"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'translate-shell')
source=("translate-popup.py::https://raw.githubusercontent.com/vicMJ/minimal-translate/main/translate-popup.py")
sha256sums=('61de2faa4834b2d5a546738f0f04a5a03a368488c0970caed68b90723fd4cf7e')

package() {
  install -Dm755 "$srcdir/translate-popup.py" "$pkgdir/usr/bin/minimal-translate"
}
