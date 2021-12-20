# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-confluencebuilder'
pkgname=('python-sphinxcontrib-confluencebuilder'
         'python2-sphinxcontrib-confluencebuilder')
pkgver='1.7.1'
pkgrel='1'
pkgdesc="Include a full table of contents in your Sphinx HTML sidebar"
arch=('any')
url="https://github.com/sphinx-contrib/fulltoc"
makedepends=('python-setuptools'
             'python2-setuptools')
license=('GPL')
source=("https://github.com/sphinx-contrib/confluencebuilder/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('fa3ad6a339fccb15b07cf023ba687b98')

package_python-sphinxcontrib-confluencebuilder(){
  depends=('python' 
           'python-sphinx')
  cd confluencebuilder-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-confluencebuilder(){
  depends=('python2' 
           'python2-sphinx')
  cd confluencebuilder-${pkgver}
  PYTHONPATH=/usr/lib/python2.7/site-packages
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
