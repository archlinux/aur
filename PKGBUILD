# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-fulltoc'
pkgname=('python-sphinxcontrib-fulltoc'
         'python2-sphinxcontrib-fulltoc')
pkgver='1.2.0'
pkgrel='2'
pkgdesc="Include a full table of contents in your Sphinx HTML sidebar"
arch=('any')
url="https://github.com/sphinx-contrib/fulltoc"
license=('GPL')
source=("https://files.pythonhosted.org/packages/8e/a6/d1297db9b75650681e5429e92e13df139ee6b64303ff1b2eea4ebd32c0a9/sphinxcontrib-fulltoc-${pkgver}.tar.gz")
md5sums=('1b4326b588ae9e7bfe69b51670b74cfb')

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
