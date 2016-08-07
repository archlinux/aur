# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>

pkgname=python-xlib-devel
_gitname=python-xlib
pkgver=0.16
pkgrel=1
pkgdesc='Python 3 bindings from the Python XLib developers community'
arch=(any)
url="https://github.com/python-xlib/python-xlib"
license=('LGPL2.1')
depends=('python')
makedepends=()
source=("https://github.com/${_gitname}/${_gitname}/archive/${pkgver}.tar.gz")
md5sums=('5ae221cfe76289dfe2b9b191aa3b6230')


build() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  python setup.py install --root "$pkgdir"
}
