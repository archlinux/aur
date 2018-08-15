# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: Ner0

pkgname=menulibre
pkgver=2.2.0
pkgrel=2
pkgdesc='An advanced menu editor that provides modern features in a clean, easy-to-use interface. All without GNOME dependencies.'
arch=('any')
url='https://launchpad.net/menulibre'
license=('GPL3')
depends=('gdk-pixbuf2' 'gnome-menus' 'gsettings-desktop-schemas' 'gtksourceview3' 'python' 'python-gobject' 'python-psutil' 'python-xdg' 'xdg-utils')
makedepends=('python-distutils-extra')
install=menulibre.install
source=("$pkgname-$pkgver::https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=("9690848dbf9196c3f7baa574e90378d8")

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
