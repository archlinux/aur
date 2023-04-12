# Maintainer: Marc Cousin <cousinmarc@gmail.com>
pkgname=python-pyrseas
_name=Pyrseas
_extractname=pyrseas
pkgver=0.10.0
pkgrel=1
epoch=1
pkgdesc="Pyrseas, Provides utilities for Postgres database schema versioning. "
url="https://github.com/perseas/Pyrseas"
license=('BSD')
depends=(python python-psycopg postgresql python-yaml)
makedepends=(python-build python-installer python-wheel)
arch=('any')
options=()
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('6419c45718fdca1bf5678502824e1ec15618b806a7b66cad4d9d531e36947a9c')

noextract=("${_name//-/_}-$pkgver-py2.py3-none-any.whl")
validpgpkeys=()

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py2.py3-none-any.whl"
}
