# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=ibus-theme-tools
_pkgname=IBus-Theme-Tools
_commit=6079cad6b6e50ac0b7552fb6ab20cbb21b3d29fd
pkgver=3
pkgrel=1
epoch=0
pkgdesc="Change the IBus GTK theme or extracting IBus style from GNOME Shell theme."
arch=('any')
url="https://github.com/openSUSE/${_pkgname}"
license=('GPL-3.0+')
makedepends=("python-setuptools")
depends=("python")
source=("https://github.com/openSUSE/${_pkgname}/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('SKIP')
package() {
  cd ${_pkgname}-${_commit}
  python setup.py install --root="$pkgdir/" --optimize=1
}
