# Maintainer: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: Ner0

pkgname=menulibre
pkgver=2.1.2
pkgrel=1
pkgdesc="An advanced menu editor that provides modern features in a clean, easy-to-use interface. All without GNOME dependencies"
arch=('any')
url="https://launchpad.net/menulibre"
license=('GPL3')
depends=('gdk-pixbuf2' 'gnome-menus' 'gsettings-desktop-schemas' 'gtksourceview3' 'python' 'python-gobject' 'python-psutil' 'python-xdg')
makedepends=('python-distutils-extra')
install=menulibre.install
source=("https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('ba20fe054352f68b02a6f3453e33b90c')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
