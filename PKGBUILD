# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=mysql-utilities-beta
_pkgname=mysql-utilities
pkgver=1.4.2
pkgrel=1
pkgdesc="A collection of command-line utilities that are used for maintaining and administering MySQL servers"
arch=('any')
url="http://dev.mysql.com/downloads/tools/utilities/"
license=('GPL')
groups=()
depends=('python2' 'python2-sphinx>=1.0' 'python2-jinja>=2.1')
makedepends=()
provides=('mysql-utilities' 'python2-mysql-connector')
conflicts=('mysql-utilities' 'python2-mysql-connector')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://cdn.mysql.com/Downloads/MySQLGUITools/$_pkgname-$pkgver.tar.gz)
md5sums=('e4866f431fe10932080507956130b31d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
