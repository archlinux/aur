# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=ibus-theme-tools
_pkgname=IBus-Theme-Tools
_commit=e21722861935a2e07b1e2575c1e41f65dccc71a1
pkgver=4.1.2
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
