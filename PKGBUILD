# $Id$
# Maintainer: Musee Ullah <lae@lae.is>

pkgname=python-lyra2re_hash
_reponame=lyra2re-hash-python
_reporef=639567bf3674730362fafbb8ae90c35bcf94b42a
pkgver=1.2.1
pkgrel=2
pkgdesc="Python module for Lyra2RE."
arch=("any")
url="https://github.com/metalicjames/lyra2re-hash-python"
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/metalicjames/${_reponame}/archive/${_reporef}.tar.gz")
sha512sums=('65dd2c23471cc4bce59c075c896b550ddc4177d0e78a01e6ba33f3b1fb8eb5ba5bac75b6997566831f1e4700bd20964262b822c262837f0bc1e3d85dc90118eb')


build() {
  cd "${srcdir}/${_reponame}-${_reporef}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_reponame}-${_reporef}"
  python setup.py install --root="${pkgdir}"
}
