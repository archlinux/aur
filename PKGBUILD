# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=xinput-gui
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple GUI for Xorg's Xinput tool."
arch=(any)
url='https://github.com/IvanFon/xinput-gui'
license=(GPL3)
depends=('gtk3' 'python' 'python-gobject' 'python-setuptools' 'xorg-xinput')

source=(https://github.com/IvanFon/xinput-gui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f4e409574937226fe2fd5cf9e149d9241c709492e77a2eb9845844827339e189')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

