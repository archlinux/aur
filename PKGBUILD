# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=ibus-theme-tools
_pkgname=IBus-Theme-Tools
_commit=fe56fcfb600a270243fd04c210bc9e3818a42e28
pkgver=4.0.0
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
