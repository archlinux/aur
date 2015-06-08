# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_pkgname=lightdm-gtk-greeter-settings
pkgname=$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc="Settings editor for LightDM GTK+ Greeter"
arch=('any')
url="https://launchpad.net/lightdm-gtk-greeter-settings"
license=('GPL3' 'LGPL3')
depends=('gtk3' 'python-gobject' 'python' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('python-distutils-extra')
provides=('lightdm-gtk-greeter-settings')
install="$pkgname.install"
source=("https://launchpad.net/$_pkgname/1.2/$pkgver/+download/$_pkgname-$pkgver.tar.gz")
sha256sums=('0450202639b947434695d5ff60b4c4b655d7399f52e5b56db4593241c8080a55')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
