# Maintainer: Foppe HEMMINGA <foppe@foppe.org>
# Contributer: György Balló <ballogy@freestart.hu>
pkgname=python2-geoclue
_pkgname=python-geoclue
pkgver=0.1.0
pkgrel=2
pkgdesc="A Geoclue python module"
arch=('any')
url="https://wiki.gnome.org/Apps/gtg/soc/python_geoclue"
license=('GPL')
depends=('geoclue' 'dbus-python' 'pygobject')
source=(http://pkgs.fedoraproject.org/repo/pkgs/${_pkgname}/${_pkgname}-${pkgver}.tar.gz/59301671769327e013492dde208e14b8/${_pkgname}-${pkgver}.tar.gz)
md5sums=('59301671769327e013492dde208e14b8')

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
