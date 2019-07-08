# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=xinput-gui
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple GUI for Xorg's Xinput tool."
arch=(any)
url='https://github.com/IvanFon/xinput-gui'
license=(GPL3)
depends=('python' 'gtk3' 'python-gobject')

source=(https://github.com/IvanFon/xinput-gui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5f7ca8953ecc84a831bea45d2aaf2554dd370705c2bacf46f529d5ba922d3157')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

