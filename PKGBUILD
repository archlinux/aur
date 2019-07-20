# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=xinput-gui
pkgver=0.3.0
pkgrel=2
pkgdesc="A simple GUI for Xorg's Xinput tool."
arch=(any)
url='https://github.com/IvanFon/xinput-gui'
license=(GPL3)
depends=('gtk3' 'python' 'python-gobject' 'python-setuptools' 'xorg-xinput')

source=(https://github.com/IvanFon/xinput-gui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f108454e91d27a058c74f86eaa87b2306b88e3b20ae8b771eaedd126894c691e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

