# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('sgtk-menu')
pkgver=1.4.0
pkgrel=1
pkgdesc="GTK menu for sway, i3 and some floating WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/sgtk-menu"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-cairo' 'python-setuptools')
optdepends=('python-pynput: for positioning in floating window managers')

source=("https://github.com/nwg-piotr/sgtk-menu/archive/v$pkgver.tar.gz")

md5sums=('1fe7e2074ea1c458fe7689d72524d2f3')

package() {
  cd "$srcdir/"$pkgname"-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

