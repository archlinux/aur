# $Id$
# Maintainer: vri <t.j.a.devries(at)gmail(dot)com>

# for customization
_pre=python-
_pkgname=sphinx-testing
_ext=
_basedir=/usr

pkgname=${_pre}${_pkgname}${_ext}
pkgver=0.7.1
pkgrel=1
pkgdesc="Testing utility classes and functions for Sphinx extensions"
arch=(any)
url="https://pypi.python.org/pypi/sphinx-testing/"
license=('BSD')
depends=('python-sphinx' 'python-six')
#optdepends=()
makedepends=('python-pip')
#options=()
source=(
         https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
         )
md5sums=(
         '0292c02299c00c1bf33c86ac50feaa79'
         )

build() {
  msg "Nothing to do..."
}

package() {
  cd "${srcdir}"
  /usr/bin/pip install --root="$pkgdir/" "${_pkgname}"
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

