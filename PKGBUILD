# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=ibus-theme-tools
_pkgname=IBus-Theme-Tools
_commit=463988b17c147d8df131391fc634ccfaba3fac4e
pkgver=4.1.3
pkgrel=1
epoch=0
pkgdesc="Generate the IBus GTK or GNOME Shell theme from existing themes."
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
