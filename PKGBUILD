# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: PHAM Van Diep <imeo at favadi dot com>

pkgname=volti
pkgver=0.2.3
pkgrel=3
pkgdesc="GTK+ mixer application for controlling alsa audio volume from system tray"
arch=('any')
url="http://code.google.com/p/volti/"
license=('GPL3')
depends=('pygtk' 'python2-pyalsaaudio' 'dbus-python')
optdepends=('python2-xlib: Multimedia keys support')
source=("http://volti.googlecode.com/files/volti-$pkgver.tar.gz")
sha256sums=('216ca23cd4e8921ea73922125048e4f23fd3146045c0ef17cc4e10108dbd80dc')

build() {
  cd volti-$pkgver

  python2 setup.py build
}

package() {
  cd volti-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
}
