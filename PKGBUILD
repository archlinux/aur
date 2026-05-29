# Maintainer: Your Name <you at domain dot tld>
pkgname=minimal-translate
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal floating GTK translation widget"
arch=('any')
url="https://github.com/vicMJ/minimal-translate"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'translate-shell')
source=("translate.py::https://raw.githubusercontent.com/vicMJ/minimal-translate/main/translate.py")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/translate-popup.py" "$pkgdir/usr/bin/minimal-translate"
}
