# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-pytest-flask
_pkgbase="${pkgbase#python-}"
pkgname=python-pytest-flask
pkgver=1.0.0
pkgrel=1
pkgdesc="A set of pytest fixtures to test Flask applications."
arch=(any)
url='https://github.com/pytest-dev/pytest-flask'
license=(MIT)
makedepends=(
  "python-pytest"
  python-setuptools
)
depends=('python-flask' 'python-werkzeug')
options=(!emptydirs)
source=("https://github.com/pytest-dev/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('7a1008d2020607d059fb34ed5c63045c904b5f2df81931199979da776238beed')

package_python-pytest-flask() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
