# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-pynbody
pkgname=('python-pynbody')	 
pkgdesc='Pynbody is a light-weight, portable, format-transparent analysis framework for N-body and hydrodynamic astrophysical simulations'
pkgver=1.1.0
pkgrel=1
url="http://pynbody.github.io/"
license=('MIT')
arch=('any')
makedepends=('git'
             'cython>=0.2')
optdepends=('python-matplotlib: plotting pynbody built-in plots'
            'ipython: makes using python much easier')
source=("https://github.com/pynbody/pynbody/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb5f9482bc27b0f3485dfd7cff5852068e923972364be531990a60da806deca9')

package_python-pynbody() {
  depends=('python>=3.3'
           'python-numpy'
           'python-scipy')	 
  cd "${srcdir}/pynbody-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
