# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgbase=python-itunes
pkgname=('python-itunes' 'python2-itunes')
pkgver=1.0
pkgrel=1
pkgdesc='A simple python wrapper to access iTunes Store API'
arch=('any')
url='https://github.com/ocelma/python-itunes'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/python-itunes/python-itunes.tar.gz")
sha256sums=('a79f1cc287554acb11afc0f2c0a93f6952c43835b53b2e34627a9144dd777277')

prepare() {
  cp -r python-itunes python-itunes-${pkgver}
  cp -r python-itunes python2-itunes-${pkgver}
}

package_python-itunes() {
  cd python-itunes-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}

package_python2-itunes() {
  cd python2-itunes-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}
