# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: Ner0

pkgname=menulibre
pkgver=2.2.1
pkgrel=1
pkgdesc="An advanced menu editor that provides modern features in a clean, easy-to-use interface"
arch=("any")
url="https://launchpad.net/menulibre"
license=("GPL3")
depends=("gdk-pixbuf2" "gnome-menus" "gsettings-desktop-schemas" "gtksourceview3" "python" "python-gobject" "python-psutil" "python-xdg" "xdg-utils")
makedepends=("python-distutils-extra")
install=menulibre.install
source=("$pkgname-$pkgver.tar.gz::$url/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=("8460ea844a5998c5f722bccb5ce8627a")

package() {
  cd "$pkgname-$pkgver" && python setup.py install --root="$pkgdir/" --optimize=1
}
