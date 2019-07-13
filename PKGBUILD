# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=xinput-gui
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple GUI for Xorg's Xinput tool."
arch=(any)
url='https://github.com/IvanFon/xinput-gui'
license=(GPL3)
depends=('gtk3' 'python' 'python-gobject' 'python-setuptools' 'xorg-xinput')

source=(https://github.com/IvanFon/xinput-gui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9532e825681ac20eb1995e2a2fb2992fcf2b24d543b103b9cd032ddf5c8281ba')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

