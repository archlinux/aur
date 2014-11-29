# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=hotwire
pkgver=0.721
pkgrel=2
pkgdesc="An intelligent hybrid text/graphical shell for developers and system administrators"
arch=('any')
url="http://code.google.com/p/hotwire-shell/"
license=('GPL')
depends=('pygtk' 'dbus-python' 'sqlite3')
makedepends=('intltool')
source=(http://hotwire-shell.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('077a32573b32c91d591b668d2dcb9645')

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  python2 setup.py bdist

  cd "${pkgdir}"
  tar zxvf "${srcdir}"/$pkgname-$pkgver/dist/*.tar.gz
}
