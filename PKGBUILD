# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-autoprogram'
pkgname=('python-sphinxcontrib-autoprogram'
	     'python2-sphinxcontrib-autoprogram')
pkgver='0.1.2'
pkgrel='1'
pkgdesc="This contrib extension provides an automated way to document CLI programs"
arch=('any')
url="https://bitbucket.org/birkenfeld/sphinx-contrib"
license=('BSD')
source=("https://pypi.python.org/packages/a2/a1/ce06bf97c2121cdfa1d2934076edece770179adf8cf3d6b4adb5abf90212/sphinxcontrib-autoprogram-${pkgver}.tar.gz")
md5sums=('0601b888f1f68b14742dc07fb21479b9')

package_python-sphinxcontrib-autoprogram() {
  depends=('python' 
           'python-sphinx')
  cd sphinxcontrib-autoprogram-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-autoprogram() {
  depends=('python2' 
           'python2-sphinx')
  cd sphinxcontrib-autoprogram-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
