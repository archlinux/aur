# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=xinput-gui
pkgver=0.2.1
pkgrel=2
pkgdesc="A simple GUI for Xorg's Xinput tool."
arch=(any)
url='https://github.com/IvanFon/xinput-gui'
license=(GPL3)
depends=('gtk3' 'python' 'python-gobject' 'python-setuptools' 'xorg-xinput')

source=(https://github.com/IvanFon/xinput-gui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b5bc720c7af10d512971cb765e605f2d8b4706d225707e69c0da72761d969bb0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

