# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-fulltoc'
pkgname=('python-sphinxcontrib-fulltoc'
         'python2-sphinxcontrib-fulltoc')
pkgver='1.1'
pkgrel='1'
pkgdesc="Include a full table of contents in your Sphinx HTML sidebar"
arch=('any')
url="https://pypi.python.org/pypi/sphinxcontrib-fulltoc"
license=('GPL')
source=("https://pypi.python.org/packages/source/s/sphinxcontrib-fulltoc/sphinxcontrib-fulltoc-${pkgver}.tar.gz")
md5sums=('eaebcd42fee9ead0d4c7916c1d6d43fd')

package_python-sphinxcontrib-fulltoc(){
  depends=('python' 
           'python-sphinx')
  cd sphinxcontrib-fulltoc-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-fulltoc(){
  depends=('python2' 
           'python2-sphinx')
  cd sphinxcontrib-fulltoc-${pkgver}
  PYTHONPATH=/usr/lib/python2.7/site-packages
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
