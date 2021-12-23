# Maintainer: Hollow Man <hollowman at opensuse dot org>
# Contributor: Hollow Man <hollowman at opensuse dot org>

pkgname=ibus-theme-tools
_pkgname=IBus-Theme-Tools
_commit=f98a61660b7ac5df0941a2bf26f53135713d7697
pkgver=4.2.0
pkgrel=0
epoch=0
pkgdesc="Generate the IBus GTK or GNOME Shell theme from existing themes."
arch=('any')
url="https://github.com/openSUSE/${_pkgname}"
license=('GPL-3.0+')
makedepends=("python-setuptools")
depends=('python' 'python-tinycss2' 'gettext')
source=("https://github.com/openSUSE/${_pkgname}/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('SKIP')
package() {
  cd ${_pkgname}-${_commit}
  python setup.py install --root="$pkgdir/" --optimize=1
}
